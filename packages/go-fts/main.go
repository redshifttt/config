package main

import (
    "fmt"
    "log"
    "os"
    "sort"
    "strconv"
    "strings"
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

    return fmt.Sprintf("%d %s", units, siUnits[unitCombo])
}

func main() {
    cwd, _ := os.Getwd()
    entries, err := os.ReadDir(cwd)
    if err != nil {
        log.Fatalln("error: ", err)
    }

    fileTypes := make([]FileType, 0)

    var fileCount int
    // var dirsCount int
    // var hiddenCount int
    var allBytesCount int64

    for _, f := range entries {
        if f.IsDir() {
            // dirsCount += 1
            continue
        }

        filename := f.Name()

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

    tblHeader := []string{"File type", "Count", "Total culminative size"}
    maxPadding := []int{0, 0, 0}

    for _, v := range fileTypes {
        if len(v.Extension) >= maxPadding[0] {
            maxPadding[0] = len(v.Extension)
        }
        if len(strconv.Itoa(v.Count)) >= maxPadding[1] {
            maxPadding[1] = len(strconv.Itoa(v.Count))
        }
    }

    if maxPadding[0] <= len(tblHeader[0]) {
        maxPadding[0] = len(tblHeader[0])
    }
    if maxPadding[1] <= len(tblHeader[1]) {
        maxPadding[1] = len(tblHeader[1])
    }

    for _, v := range tblHeader {
        fmt.Printf("\x1b[1m%s ", v)
    }
    fmt.Printf("\x1b[0m\n")

    // I guess this mess works?
    for _, v := range fileTypes {
        formattedLine := ""
        formattedLine += "%-"
        formattedLine += strconv.Itoa(maxPadding[0])
        formattedLine += "s"

        formattedLine += " "

        formattedLine += "%-"
        formattedLine += strconv.Itoa(maxPadding[1])
        formattedLine += "d"

        formattedLine += " "

        formattedLine += "%s"
        formattedLine += "\n"

        fmt.Printf(formattedLine, v.Extension, v.Count, humanizeUnits(v.BytesCount))
    }
}
