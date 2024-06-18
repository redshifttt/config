import os
import sys
import mimetypes as mime
from prettytable import PrettyTable, PLAIN_COLUMNS, NONE, SINGLE_BORDER

def humanize_units(units, colour=True):
    unit_combo = 0
    si_units = ["B", "KB", "MB", "GB", "TB"]

    while units >= 1024:
        units /= 1024
        unit_combo += 1

    if not colour:
        return f"{units:.0f} {si_units[unit_combo]}"

    match unit_combo:
        case 4:
            # Red bold
            return f"\x1b[38;5;124m{units:.0f} {si_units[unit_combo]}\x1b[0m"
        case 3:
            if units > 5:
                # Red bold
                return f"\x1b[38;5;166m{units:.0f} {si_units[unit_combo]}\x1b[0m"

            # Normal bold
            return f"\x1b[38;5;172m{units:.0f} {si_units[unit_combo]}\x1b[0m"
        case _:
            return f"{units:.0f} {si_units[unit_combo]}"

def get_file_extension(f):
    filesize = f.stat().st_size
    _, extension = os.path.splitext(f)

    if not extension:
        unknown_ext[0] += 1
        unknown_ext[1] += filesize
        return

    if not extension in cat_count.keys():
        cat_count[extension] = [1, filesize]
    else:
        cat_count[extension][0] += 1
        cat_count[extension][1] += filesize

cat_count = {}
mime_count = {}
unknown_ext = [0, 0]

t = PrettyTable()
t.align = "l"
t.vrules = NONE
t.field_names = ["Type", "Count", "Total culminative size"]

file_counter = 0

if "-r" in sys.argv[1:]:
    for root, dirs, files in os.walk(os.getcwd()):
        if files:
            for f in os.scandir(root):
                if not f.is_file():
                    continue

                if f.name.startswith("."):
                    continue

                file_counter += 1
                sys.stdout.write(f"\rfound {file_counter} files")

                get_file_extension(f)
else:
    for f in os.scandir(os.getcwd()):
        if not f.is_file():
            continue

        if f.name.startswith("."):
            continue

        file_counter += 1
        sys.stdout.write(f"\rfound {file_counter} files")

        get_file_extension(f)

if unknown_ext[0]:
    cat_count["unknown"] = unknown_ext

cat_count = dict(sorted(cat_count.items(), key=lambda x: x[1][0], reverse=True))

total_count = 0
total_filesize = 0
for v in cat_count.values():
    total_count += v[0]
    total_filesize += v[1]

last_item = len(cat_count.items()) - 1
for n, v in enumerate(cat_count.items()):
    cat = v[0]
    amount, size = v[1]
    size = humanize_units(size)
    if not n == last_item:
        t.add_row([cat, amount, size])
        continue

    t.add_row([cat, amount, size], divider=True)

if not len(cat_count.items()) == 1:
    t.add_row(["Total", total_count, humanize_units(total_filesize, colour=False)])

sys.stdout.write(f"\r{t}\n")

