#!/usr/bin/env sh

# --- Global constants
ansi_reset='\033[0m'
ansi_red='\033[0;31m'
ansi_green='\033[0;32m'
ansi_yellow='\033[0;33m'

# --- Helper functions
echo_err_exit() {
    >&2 printf '%bERROR:%b %s\nAborting.\n' "$ansi_red" "$ansi_reset" "$1"
    exit 1
}

echo_info() {
    printf '%bINFO:%b %s\n' "$ansi_yellow" "$ansi_reset" "$1"
}

echo_ok() {
    printf '%bOK:%b %s\n' "$ansi_green" "$ansi_reset" "$1"
}

extract_tangled_filename() {
    file=$1

    output_filename=$(awk '/^---/{fm=fm+1}/^tangle: /{if(fm==1);print $2}' "$file")
    # exapand tilde (`~`) to full `$HOME` path
    output_filename=$(echo "$output_filename" | sed "s|^~|$HOME|")
    
    echo "$output_filename"
}

# --- Parse arguments
unset arg_help
unset arg_dry_run
unset arg_overwrite
unset arg_invalid_opt
while getopts "hdo" opt
do
    case "$opt" in
        h)      arg_help=true;;
        d)      arg_dry_run=true;;
        o)      arg_overwrite=true;;
        [?])    arg_invalid_opt=true
                arg_help=true;;
    esac
done

# --- Show help
if [ "$arg_help" = true ]
then
    echo ""
    echo "Usage: $0 [-h] [-d] [-o] FILE ..."
    echo " -h   Show this help screen and exit. Other parameters will be ignored."
    echo " -d   Dry-run. See which files would be modified without writing to disk."
    echo " -o   Overwrite existing files with tangled output."
    
    if [ "$arg_invalid_opt" = true ]
    then
        exit 1
    else
        exit 0
    fi
fi

if [ "$arg_dry_run" = true ]
then
    echo_info "Running in dry-run mode."
fi

# --- Validation
file_args=$(echo "$@" | cut -d ' ' -f "$OPTIND-")
for file in $file_args
do
    # Check if file arguments exist
    if [ ! -f "$file" ]
    then
        echo_err_exit "'$file' does not exist, or is not a regular file."
    fi
    
    # Check if output file is declared
    output_filename=$(extract_tangled_filename "$file")
    
    # Check that 'tangle' property is declared in Markdown frontmatter
    if [ -z "$output_filename" ]
    then
        echo_err_exit "'tangle:' property in frontmatter of '$file' is empty or missing."
    fi
    
    # Check that output file doesn't already exist
    if [ "$arg_overwrite" != true ] && [ -f "$output_filename" ]
    then
        echo_err_exit "Tangle output file '$output_filename' declared in '$file' already exists. Try again using option '-o' to overwrite."
    fi

    # If overwriting and output file exists, ensure it's a regular file
    if [ "$arg_overwrite" = true ] && [ -e "$output_filename" ] && [ ! -f "$output_filename" ]
    then
        echo_err_exit "Tangle output file '$output_filename' declared in '$file' is not a file."
    fi
    
    # If overwriting and output file exists, check for sufficient permissions
    if [ "$arg_overwrite" = true ] && [ -f "$output_filename" ] && [ ! -w "$output_filename" ]
    then
        echo_err_exit "Insufficient permissions to write to existing file '$output_filename' declared in '$file'."
    fi

    # If creating new file, check for sufficient permissions
    if [ ! -f "$output_filename" ]
    then
        if ! touch "$output_filename"
        then
            echo_err_exit "Cannot write to '$output_filename' declared in '$file'."
        else
            rm "$output_filename"
        fi
    fi
done

for file in $file_args
do
    output_filename=$(extract_tangled_filename "$file")
    
    if [ "$arg_dry_run" = true ]
    then
        echo_ok "Code blocks in '$file' would be written to '$output_filename'."
    else
        awk '/^```/{a=(a+1)%2;next}a' "$file" > "$output_filename"
        echo_ok "Successfully exported code blocks in '$file' to '$output_filename'."
    fi
done

echo_ok "Done."