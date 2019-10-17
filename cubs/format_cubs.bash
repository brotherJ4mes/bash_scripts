#!/bin/bash

rm *.tmp

in_file=$1

# stack lines, remove redundant white space, add commas
sed -n '2,$p' $in_file | paste - - | sed -r 's/-/,/g;s/[0-9]{4}/&,/g;s/Arena/Arena,/g' | sed -r 's/\s+/ /g' > fields.tmp

# generate dates
cut -d, -f 1-3 fields.tmp  | xargs -n4 -iz date -d z +%Y-%m-%d > dates.tmp

# print header to outfile
echo Start Date, End Date,   Start Time, End Time, Location, Subject > out.csv

# combine dates and fields to outfile
paste -d, dates.tmp dates.tmp  <(cut -d, -f 4- fields.tmp) >> out.csv

# cleanup spaces
sed -i 's/ , /,/g;s/,/, /g' out.csv 


rm *.tmp
