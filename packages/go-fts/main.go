package main

import (
    "fmt"
    "log"
    "os"
    "sort"
    "strconv"
    "strings"

    "github.com/rodaine/table"
)

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

    return strconv.FormatInt(int64(units), 10) + " " + siUnits[unitCombo]
}

func main() {
    cwd, _ := os.Getwd()
    entries, err := os.ReadDir(cwd)
    if err != nil {
        log.Fatalln("error: ", err)
    }

    entriesCount := len(entries)
    fmt.Printf("Found %d files", entriesCount)

    fileTypes := make([]FileType, 0)

    dirsCount := 0
    hiddenCount := 0

    for _, f := range entries {
        if f.IsDir() {
            dirsCount += 1
            continue
        }

        filename := f.Name()

        if strings.HasPrefix(filename, ".") {
            hiddenCount += 1
            continue
        }

        splitFileName := strings.Split(filename, ".")
        if len(splitFileName) == 1 {
            continue
        }

        foundFileType := splitFileName[len(splitFileName)-1]

        fileInfo, err := f.Info()
        if err != nil {
            log.Fatalf("error: %s\n", err)
        }

        fileSize := fileInfo.Size()

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

    totalCount := func(fts []FileType) int {
        count := 0

        for _, v := range fts {
            count += v.Count
        }
        return count
    }

    fmt.Printf(", of which %d have filetypes\n", totalCount(fileTypes))

    tbl := table.New("File type", "Count", "Total culminative size")

    for _, v := range fileTypes {
        tbl.AddRow(v.Extension, v.Count, humanizeUnits(v.BytesCount))
    }

    if hiddenCount >= 1 {
        tbl.AddRow("hidden files", hiddenCount, "---")
    }
    if dirsCount >= 1 {
        tbl.AddRow("directories", dirsCount, "---")
    }

    tbl.Print()
}
