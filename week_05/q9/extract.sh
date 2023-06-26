#!/bin/dash

case $# in
  0)
    echo "Usage: $0 <file> [<file> ...]"
    exit 2
    ;;
esac

# if [ "$#" -eq 0 ];
# then
#     echo "Usage: $0 <file> [<file> ...]"
#     exit 2
# fi

status=0

for archive in "$@";
do
    if [ ! -f "$archive" ]; then
        echo "$0: error: '$archive' is not a file" >&2
        status=1
        continue
    fi

    case "$archive" in
        *.tar.bz2)
            tar xjf    "$archive" ;;
        *.tar.gz)
            tar xzf    "$archive" ;;
        *.tar.xz)
            tar xJf    "$archive" ;;
        *.bz2)
            bunzip2    "$archive" ;;
        *.rar)
            rar x      "$archive" ;;
        *.gz)
            gunzip     "$archive" ;;
        *.tar)
            tar xf     "$archive" ;;
        *.tbz2)
            tar xjf    "$archive" ;;
        *.tgz)
            tar xzf    "$archive" ;;
        *.zip)
            unzip      "$archive" ;;
        *.jar)
            unzip      "$archive" ;;
        *.Z)
            uncompress "$archive" ;;
        *.7z)
            7z x       "$archive" ;;
        *)
            echo "$0: error: '$archive' cannot be extracted" >&2
            status=1
        ;;
    esac
done

exit $status