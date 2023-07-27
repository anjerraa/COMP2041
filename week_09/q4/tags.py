#! /usr/bin/env python3

import sys, subprocess, re, collections, argparse

def main():
    # Create an argument parser and specify the expected arguments for running 
    # the script. Arguments that start with `-` are optional arguments.
    # `action="store_true` makes the flag a boolean (true if it's given, false
    # if it's not given).
    parser = argparse.ArgumentParser()
    parser.add_argument('-f', action="store_true")
    parser.add_argument('url')
    args = parser.parse_args()

    url = args.url
    
    # Fetches the HTML content of the webpage
    process = subprocess.run(f"wget -q -O- {url}", shell=True, capture_output=True, text=True)
    webpage = process.stdout.lower()

    # To match for multi-line comments, we use the `re.DOTALL` flag
    # so that the `.` matches any character including the newline character
    # (by default it does not match the newline character).
    # Moreover, if you were to have some HTML content in between two comments,
    # the regex would match the whole group and subsequently delete the HTML
    # content. This is because by default `.*` does greedy matching, which means
    # it would try to match for the longest matching sequence. Thus, we add the `?`
    # after `.*` to say we want to match for the shortest matching sequence.
    webpage = re.sub(r"<!--.*?-->", "", webpage, flags=re.DOTALL)

    # Without using capture groups, `findall()` would return the tag names along
    # with the `<` and any whitespaces that occurs after it and before the tag name.
    # If we only want the tag names, we can wrap parentheses around the pattern for 
    # the tag name. If capture group is used in the regex, `findall()` would return
    # the capture groups.
    tags = re.findall(r"<\s*(\w+)", webpage)

    # We can also use a normal dictionary but a Counter collection allows us to
    # easily increment the values of each key because by default all keys have
    # initial values of 0.
    tags_counter = collections.Counter()
    for tag in tags:
        tags_counter[tag] += 1
    
    # If given the `-f` flag, print in order of tag counts
    if args.f:
        for tag, count in reversed(tags_counter.most_common()):
            print(tag, count)
    else:
        # `sorted()` will sort the (key, value) pairs by the key.
        for tag, count in sorted(tags_counter.items()):
            print(tag, count)

if __name__ == "__main__":
    main()