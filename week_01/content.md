# Week 01

## 🌐 Course introduction
**Course website**

Please have a read through the course outline and know how to navigate through the website to find relevant information to you.

[COMP(2041|9044) 23T2 — Software Construction](https://cgi.cse.unsw.edu.au/~cs2041/23T2/)

**Ed forum**

Login is your zID email (i.e. `z1234567@unsw.edu.au`) and your zID password.

[Ed Discussion](https://edstem.org/au/courses/12028/discussion/)

## 🖥️ Operating systems
- **What is an operating system?**
    
    An operating system is a piece of software that manages the hardware of a computer and provides an interface to the programs that run on the computer.
    
- **What operating systems are being used in your house/tutorial room?**
    - (Linux) Ubuntu, Debian, Arch, Gentoo, Red Hat, Fedora, Android, SteamOS (Arch derivative), [etc](https://en.wikipedia.org/wiki/List_of_Linux_distributions), [etc](https://upload.wikimedia.org/wikipedia/commons/1/1b/Linux_Distribution_Timeline.svg).
    - (Darwin (Apple)) macOS (previously: OS X (previously: mac OS X)), iOS, iPadOS, WatchOS, [etc](https://en.wikipedia.org/wiki/List_of_Apple_operating_systems), [etc](https://photos2.insidercdn.com/osxserver101409-1.png).
    - (Windows (Microsoft)) Windows, Windows Phone, Windows Mobile, Xbox, [etc](https://en.wikipedia.org/wiki/List_of_Microsoft_operating_systems), [etc](https://upload.wikimedia.org/wikipedia/commons/3/39/Microsoft_timeline_of_operating_systems_2.png).
    - (BSD) FreeBSD, NetBSD, OpenBSD, PlaystationOS (FreeBSD derivative)
- **What operating system(s) do CSE lab computers run?**
    
    CSE's lab computers and servers run (Linux) Debian (currently version 4.19).
    
    You can check using the command `uname -a` in your terminal.
    

## 🧠 Recap on regex and grep
📊 **Recap on filters**

- Filter is a program that transforms a byte stream
- Reads bytes from their standard input or specified files, then perform useful transformation on the stream, and write the transformed bytes to standard output or specified files
- Examples: `cat`, `grep`, `wc`, `tr`, `head`/`tail`, `cut`, `sort`, `uniq`, `sed`, `find`, `join`, `paste`, `tee`, and `xargs`

🧠 **************Recap on regular expression (regex)**************

- Concise powerful notation for sets of strings
- Pattern matching
- Effective use of regex makes you much more productive
- Useful for manipulation of textual data

Rules:

Basics: any regex can be written using only `()`, `*`, `|` and `\`.

|  | Unless a character has a special meaning, it matches itself
a matches a |
| --- | --- |
| p* | Zero or more repetitions of p
matches  , p, pp, ppp, … |
| pattern1 | pattern2 | Union of pattern1 and pattern2
hello|world matches hello, world |
| () | Parentheses are used for grouping
(d|e)*(f|g) matches f, g, df, dg, ef, eg, ddf, deg, … |
| \ | Removes special meaning of the following character
\* matches * |

Matching single characters:

| . | Matches any single character
. matches a, b, !, … |
| --- | --- |
| [] | Matches any one of a set of character → can think of it as ‘or’
[aeiouAEIOU] matches any English vowel
Shorthand is available to represent a range of characters
[a-z] matches any lowercase English letter
^ inverts the meaning of square brackets
[^123] matches any characters except 1, 2 and 3
Any other characters lose their special meaning inside bracket expressions |

Anchoring matches:

| ^ | When not inside square brackets, they match the start of the string
^h matches hello but not short |
| --- | --- |
| $ | Matches the end of a string
^cat.*dog$ matches any string starting with cat and ending with dog |

Matching repeated characters:

| p* | Matches zero or more repetitions of p |
| --- | --- |
| p+ | Matches one or more repetitions of p |
| p? | Matches zero or one occurrence of p |
| p{n} | Matches n repetitions of p |
| p{n,m} | Matches n to m repetitions of p |
| p{n,} | Matches n or more repetitions of p |
| p{,m} | Matches m or less repetitions of p |

💾 **************************Recap on grep**************************

- `grep` copies to stdout the lines that match a specified regex
- It has useful flags:
    - `-i` ignores upper/lower case
    - `-v` displays lines that do not match the pattern
    - `-c` print a count of matching lines
    - `-w` only match pattern if it makes a complete word
    - `-F` matches strings only (no regex)
    - `-G` matches a subset of regex (no +, ?, |, (), {})
    - `-E` matches full POSIX regex***
    - `-P` matches POSIX regex + Perl extensions

## ⚙️ Practice with regex and grep

---

[regex101: build, test, and debug regex](https://regex101.com/)

******Regex practice******

- Write a regex to match C preprocessor commands in a C program source file
    
    ```bash
    ^#
    ```
    
- All the lines in a C program except preprocessor commands
    
    ```bash
    ^[^#]|^$
    ```
    
- All lines in a C program with trailing white space (one or more white space at the end of line)
    
    ```bash
    \s*$
    # \s is a bracket expression that matches any white space character.
    ```
    
- The names "Barry", "Harry", "Larry" and "Parry”
    
    ```bash
    ^[BHLP]arry$
    ```
    
- A string containing the word "hello" followed, some time later, by the word "world”
    
    ```bash
    hello.*world
    ```
    
- The word "calendar" and mis-spellings where 'a' is replaced with 'e' or vice-versa
    
    ```bash
    c[ae]l[ae]nd[ae]r
    ```
    
- A list of positive integers separated by commas
    
    ```bash
    [1-9][0-9]*(,[1-9][0-9]*)*
    ```
    
- A C string whose last character is newline
    
    ```bash
    "[^"]*\\n"
    # Regex cannot handle escaped quotes
    ```
    
- This regular expression `[0-9]*.[0-9]*` is intended to match floating point numbers such as '42.5'. Is it appropriate?
    
    No, because the dot can match any character. The more appropriate regex would be `(0|[1-9][0-9]*)\.([0-9]*[1-9]|0)` (note the escape on the dot and how the regex accounts for repetitions or 0)
    

**Grep practice**

- Why does `grep -E hello` seem to be taking a long time to run?
    
    Because it is waiting for input from stdin.
    
- Why won’t `grep -E int main program.c` work?
    
    `grep -E` will attempt to search files **main** and **program.c** for lines containing the string **int**
    
- Give five reasons why this attempt to search a file for HTML paragraph and break tags may fail `grep <p>|<br> /tmp/index.html`
    1. `<`, `>` and `|` are part of the shell’s syntax so the shell will interpret them rather than passing them to `grep` → avoid by wrapping the regex expression with single or double quotes
    2. `grep` by itself doesn’t implement `|` so will need to use `grep -E`
    3. The supplied regex expression won’t match the HTML tags if they’re in upper case (e.g. `<P></P>`) so use `grep -Ei` to make it case-insensitive
    4. The supplied regular expression also won't match HTML tags containing spaces, e.g: `<p >` so account for the whitespaces i.e. `grep -Ei '<\s*(p|br)\s*>' /tmp/index.html`
    5. The HTML tag may contain attributes, e.g: `<p class="lead_para">` so change it to `grep -Ei '<\s*(p|br)[^>]*>' /tmp/index.html`
- Write a `grep -E` command which will print any lines in a file `ips.txt` containing an IP addresses in the range `129.94.172.1` to `129.94.172.25`
    
    ```bash
    grep -E '129\.94\.172\.([1-9]|1[0-9]|2[0-5])' ips.txt
    ```
