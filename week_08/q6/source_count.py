#!/usr/bin/env python3

from glob import glob

def main():
    total_lines = 0
    for filename in glob("*.[ch]"):
        with open(filename) as f:
            num_lines = len(f.readlines())
            print(f"{str(num_lines).rjust(8)} {filename}")
            total_lines += num_lines
    
    print(f"{str(total_lines).rjust(8)} total")

if __name__ == "__main__":
    main()