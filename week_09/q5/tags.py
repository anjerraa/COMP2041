#! /usr/bin/env python3

import sys, subprocess, collections, argparse, bs4, requests

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
    
    # Get the HTML content of the webpage via the `requests` module
    response = requests.get(args.url)
    webpage = response.text.lower()

    # Create a BeautifulSoup object using the webpage and specify it as HTML
    soup = bs4.BeautifulSoup(webpage, 'html5lib')

    # `find_all()` will find all HTML tags in the given soup
    tags = soup.find_all()
    tags = [tag.name for tag in tags]

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