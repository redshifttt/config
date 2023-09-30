from os import listdir, getcwd
from sys import argv

def count_visible_filetypes(working_directory):
    filetypes = []
    seen = {}

    for f in listdir(working_directory):
        if not "." in f:
            continue

        if f.startswith("."):
            continue

        filetypes.append(f.split(".")[-1:][0])

    for t in filetypes:
        if not t in seen:
            seen[t] = 0 # init in dict
            seen[t] += 1 # you have been seen
            continue

        seen[t] += 1

    sum_of_values = sum(seen.values())

    for k in seen:
        v = seen[k]
        seen[k] = str(v)

    seen = sorted(seen.items(), key=lambda x: x[1], reverse=True)

    space_width = len(seen[0][1])

    for v in seen:
        bar = "#" * int(v[1])
        print(f"{v[0]}\t| {v[1]:>{space_width}} {bar}".expandtabs(4))

cwd = getcwd()

if len(argv) == 2:
    cwd = argv[1]

count_visible_filetypes(cwd)
