import os
import sys
import mimetypes as mime

def count_visible_filetypes(dir):
    # filetypes = []
    # seen = {}
    cat_count = {}

    for f in os.scandir(dir):
        if not f.is_file():
            continue
        if f.name.startswith("."):
            continue

        filename = f.name
        mime_type = list(mime.guess_type(filename))

        if mime_type[0] == None:
            mime_type[0] = "text/plain"

        top_category, filetype = mime_type[0].split("/")
        top_category = top_category.upper()

        if not top_category in cat_count:
            cat_count[top_category] = {}

        if not filetype in cat_count[top_category]:
            cat_count[top_category][filetype] = 1
        else:
            cat_count[top_category][filetype] += 1

    cat_count = sorted(cat_count.items(), key=lambda x: x[0])
    for c in cat_count:
        print(c[0])

        types = sorted(c[1].items(), key=lambda x: x[1], reverse=True)
        for k,v in types:
            print(f"\t{v} {k}".expandtabs(2))

if len(sys.argv) == 2:
    cwd = sys.argv[1]
else:
    cwd = os.getcwd()

count_visible_filetypes(cwd)
