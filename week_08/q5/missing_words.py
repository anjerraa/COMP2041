#!/usr/bin/env python3

import sys

def main():
    if len(sys.argv) != 3:
        print(f"{sys.argv[0]}: usage: [file1] [file2]")
        exit(1)
    
    file1 = sys.argv[1]
    file2 = sys.argv[2]

    words1 =  set()
    with open(file1) as f1:
        for word in f1:
            words1.add(word.strip())
    
    words2 =  set()
    with open(file2) as f2:
        for word in f2:
            words2.add(word.strip())

    for word in words1 - words2:
        print(word)

if __name__ == "__main__":
    main()