#! /usr/bin/env python3

import os
import shutil
import subprocess
import sys

font_file = "/usr/share/fonts/TTF/SymbolsNerdFontMono-Regular.ttf"
if not os.path.exists(font_file):
    sys.stderr.write("Error: The font file does not exist.\n")
    sys.exit(1)

if shutil.which("otfinfo") is None:
    sys.stderr.write("Error: otfinfo not found.\n")
    sys.exit(1)

def create_maps(numbers):
    start = numbers[0]
    end = start
    maps = []

    for number in numbers[1:]:
        if number == end + 1:
            end = number
        else:
            codepoints = f"U+{start:X}" if start == end else f"U+{start:X}-U+{end:X}"
            maps.append(f"symbol_map {codepoints} Symbols Nerd Font Mono")

            start = end = number

    codepoints = f"U+{start:X}" if start == end else f"U+{start:X}-U+{end:X}"
    maps.append(f"symbol_map {codepoints} Symbols Nerd Font Mono")

    return maps

output = subprocess.check_output(f"otfinfo -u {font_file} | cut -c4-7", shell=True, text=True)
numbers = [int(line.strip(), 16) for line in output.strip().split('\n')]
maps = create_maps(numbers)

symbol_map_file = os.path.join(os.getenv("HOME"), ".config", "kitty", "symbol_map.conf")
with open(symbol_map_file, "w") as file:
    for map in maps:
        file.write(f"{map}\n")

print("Symbol map written successfully!")
