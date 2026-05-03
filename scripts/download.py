#!/bin/python3

from subprocess import run
from sys import argv, exit

HELP_MSG = [
    "download.py [args]",
    "",
    "-h: print this help",
    "",
    "-s: skip option:",
    "   skips asking you for action when yt-dlp fails",
    "",
    "-v: virus scan option:",
    "   scans the downloaded file after it is finished with clamav",
    "   requires 'clamav' installed",
    "",
    "download.py requires yt-dlp & clamav packages installed",
    "download.py downloads multiple media with yt-dlp that are listed in a list.txt file",
    "list.txt must be in the same dir as download.py",
    "",
    "in [args] you can only do -sv or -vs or -s, etc you can't do -s -v, and -h option must be alone",
]

cmd = ""
if len(argv) >= 2:
    cmd = argv[1]

skip_warn = False
scan = False

if cmd == "-s":
    skip_warn = True
elif cmd == "-v":
    scan = True
elif cmd == "-sv" or cmd == "-vs":
    scan = True
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


content = ""

try:
    with open("list.txt") as f:
        content = f.read().splitlines()
except FileNotFoundError:
    print("file 'list.txt' not found")
    exit()

for i in content:
    print(i)

answer = input("download the list? 1=yes, 0=no: ")

if answer == "1":
    for i in content:
        result = run(["yt-dlp", "--downloader aria2c", i])
        if result.returncode != 0:
            if not skip_warn:
                print("yt-dlp failed:")
                print(" check url in list.txt or retry")
                answer = input("continue download? 1=yes, 0=no: ")
                if answer != "1":
                    exit()

else:
    print("request denied")

if scan:
    print("do you want to scan current working dir.")
    answer = input("for viruses with clamav? 1=yes, 0=no: ")
    if answer == "1":
        run(["mkdir", "infected"])
        print("updating virus signiture database, requires sudo")
        run(["sudo", "freshclam"])
        result = run(["clamscan", "-r", "--infected", "--move=./infected", "."])
        if result.returncode == 1:
            print("viruses were found")
            print("they were moved to 'infected' dir")
        elif result.returncode == 0:
            print("viruses were not found")
            print("'infected' dir must be empty")
        else:
            print("an error during scan has happened")
