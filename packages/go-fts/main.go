package main

import (
	"fmt"
	"io/fs"
	"log"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"text/tabwriter"
)

var entries []fs.DirEntry
var cwd string

type FileType struct {
    Extension  string
    Count      int
    BytesCount int64
}

func humanizeUnits(units int64) string {
    unitCombo := 0
    siUnits := []string{"B", "KB", "MB", "GB", "TB"}

    for {
        if units >= 1024 {
            units /= 1024
            unitCombo += 1
        } else {
            break
        }
    }

    return fmt.Sprintf("%d %s", units, siUnits[unitCombo])
}

// TODO: somehow I fixed not collecting files in hidden directories but now it
// does again?
func collectEntry(path string, entry fs.DirEntry, err error) error {
    relativePath := strings.Replace(path, cwd + "/", "", 1)
    if strings.HasPrefix(relativePath, ".") {
        return nil
    }

    entries = append(entries, entry)
    return nil
}

func main() {
    var err error

    cwd, err := os.Getwd()

    if err != nil {
        log.Fatalln("error: ", err)
    }

    if len(os.Args) > 1 {
        if os.Args[1:][0] == "-r" {
            err = filepath.WalkDir(cwd, collectEntry)
            if err != nil {
                log.Fatalln("error: ", err)
            }
        }
    } else {
        entries, err = os.ReadDir(cwd)
        if err != nil {
            log.Fatalln("error: ", err)
        }
    }

    fileTypes := make([]FileType, 0)

    var fileCount int
    var allBytesCount int64

    for _, f := range entries {
        if f.IsDir() {
            // dirsCount += 1
            continue
        }

        filename := filepath.Base(f.Name())

        if strings.HasPrefix(filename, ".") {
            // hiddenCount += 1
            continue
        }

        splitFileName := strings.Split(filename, ".")
        if len(splitFileName) == 1 {
            continue
        }

        fileCount += 1
        foundFileType := splitFileName[len(splitFileName)-1]

        fileInfo, err := f.Info()
        if err != nil {
            log.Fatalf("error: %s\n", err)
        }

        fileSize := fileInfo.Size()
        allBytesCount += fileSize

        isFound := false
        for n, v := range fileTypes {
            if foundFileType == v.Extension {
                fileTypes[n].Count += 1
                fileTypes[n].BytesCount += fileSize
                isFound = true
            }
        }

        if !isFound {
            fileTypes = append(fileTypes, FileType{
                Extension:  foundFileType,
                Count:      1,
                BytesCount: fileSize,
            })
        }
    }

    sort.Slice(fileTypes, func(i, j int) bool {
        return fileTypes[i].Count > fileTypes[j].Count
    })

    fmt.Printf("Total: %d", fileCount)
    fmt.Printf(" (%s)\n", humanizeUnits(allBytesCount))

    w := tabwriter.NewWriter(os.Stdout, 1, 1, 2, ' ', 0)

    fmt.Fprintf(w, "%s\t%s\t%s\n", "File type", "Count", "Total culminative size")

    for _, v := range fileTypes {
        fmt.Fprintf(w, "%s\t%d\t%s\n", v.Extension, v.Count, humanizeUnits(v.BytesCount))
    }

    w.Flush()
}
