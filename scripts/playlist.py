#!/bin/python

# playlist is a simple script that plays videos/mp3s inside the current working directory
# using MPV media player

from subprocess import run
from sys import argv, exit
from pathlib import Path

HELP_MSG = [
    "playlist.py [args]",
    "",
    "-h: print this help",
    "",
    "-s: skip dir:",
    "   skips asking you for which dir to play in",
]

cmd = ""
if len(argv) >= 2:
    cmd = argv[1]

skip_dir = False

if cmd == "-s":
    skip_warn = True
elif cmd == "-h":
    for i in HELP_MSG:
        print(i)
    exit()
elif cmd == "":
    pass
else:
    print("wrong commands")
    print("")
    for i in HELP_MSG:
        print(i)
    exit()

if not skip_dir:
    run(["ls -ha"])
    print("")
    dir = input("which directory you want to play: ")


if dir:
    run(["cd", f"{dir}"])

list = run(["ls"],capture_output=True)

for i in list.stdout:
    file = Path(f"./{i}")
    if not file.is_dir:
        run(["mpv", f"{i}"])
