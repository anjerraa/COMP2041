#!/usr/bin/env python3

def print_dict(d):
    for key, val in d.items():
        print(f"[{key}] => {val}")

def main():
    d = {
        "name": "Angella",
        "age": 20,
        "email": "mai.pham@unsw.edu.au",
    }
    print_dict(d)

if __name__ == "__main__":
    main()