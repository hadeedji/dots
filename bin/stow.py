#! /usr/bin/env python3

import os
import re
import shutil
import sys

DOTS = os.getenv("DOTS", os.getcwd())

def stow(pkg, stow_dir):
    pkg_path = os.path.join(DOTS, pkg)

    for root, dirs, files in os.walk(pkg_path):
        files = [f for f in files if not f.startswith(".")]
        dirs[:] = [d for d in dirs if not d.startswith(".")]

        symlink_dir = root.replace(pkg_path, stow_dir)
        if not os.path.exists(symlink_dir):
            os.makedirs(symlink_dir)

        for file in files:
            source = os.path.join(root, file)
            target = os.path.join(symlink_dir, re.sub("^dot-", ".", file))

            if os.path.isfile(target) or os.path.islink(target):
                os.remove(target)

            os.symlink(source, target)

def get_pkgs():
    pkgs = []

    if len(sys.argv) > 1:
        for pkg in sys.argv[1:]:
            if os.path.isdir(os.path.join(DOTS, pkg)):
                pkgs.append(pkg)
            else:
                print(f"The package {pkg} is not a valid package.", file=sys.stderr)
    else:
        pkgs = [d for d in os.listdir(DOTS) if not d.startswith(".")]

    return pkgs

def get_stow_dir(pkg):
    return os.path.expanduser({
        "home"       : "~",
        "bin"        : "~/bin",
        "config"     : "~/.config",
        "wallpapers" : "~/pics/wallpapers"
    }.get(pkg, f"~/.config/{pkg}"))

if __name__ == "__main__":
    for pkg in get_pkgs():
        if pkg in ["docs"]: continue

        stow(pkg, get_stow_dir(pkg))
