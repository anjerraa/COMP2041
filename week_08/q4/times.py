#!/usr/bin/env python3

import sys

def main():
    if len(sys.argv) != 4:
        print(f"{sys.argv[0]}: usage: [n_rows] [n_cols] [col_width]")
        exit(1)

    n_rows = int(sys.argv[1])
    n_cols = int(sys.argv[2])
    col_width = int(sys.argv[3])

    for r in range(1, n_rows + 1):
        for c in range(1, n_cols + 1):
            print(f"{str(r * c).rjust(col_width)} ", end="")
        print()

if __name__ == "__main__":
    main()