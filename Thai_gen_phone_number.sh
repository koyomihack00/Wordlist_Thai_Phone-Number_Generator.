#!/bin/bash

output_file="phone_numbers.txt"

# Clear the output file if it exists
> $output_file

# Generate numbers for each prefix
for prefix in 08 06 09; do
    seq -f "${prefix}%08.0f" 0 99999999 | pv -s 100000000 >> $output_file
done

# Add numbers for + prefixes
for prefix in "+08" "+06" "+09"; do
    seq -f "${prefix}%08.0f" 0 99999999 | pv -s 100000000 >> $output_file
done
