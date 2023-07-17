#!/usr/bin/env python3

import sys, subprocess, re

def main():
    for url in sys.argv[1:]:
        process = subprocess.run(f"wget -q -O- {url}", shell=True, capture_output=True, text=True)
        webpage = process.stdout
        for number in re.findall(r"[\d \-]+", webpage):
            number = re.sub(r"\D", "", number)
            if 8 <= len(number) and len(number) <= 15:
                print(number)

if __name__ == "__main__":
    main()