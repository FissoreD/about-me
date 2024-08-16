#!/bin/bash

# The goal of this file is to add two dates into the _post and _tags:
# 1. the posted date 2. the date (:= last modification)
# the CI executes this scripts by adding the new infos so that it is correctely
# printed in the online version

# Get the commits history for a specific file
date_info="git log --follow --format=%aI --date default"

date_0 () {
  ${date_info} $1 | tail -1
}

date_n () {
  ${date_info} $1 | head -1
}

add_line_after () {
  # $1 = Date description
  # $2 = Timestamp
  # $3 = FileName
  # We add the wanted line at position 2 and then print the result in the 
  # file passed in argument
  sed -i "/$1/d" $3;
  sed -i "2i$1 $2" $3;
}

for f in ./_posts/* ./_tabs/*; do
  if [ $f != ./_tabs/publications.md ]; then
    x=$(date_0 $f);
    y=$(date_n $f);
    add_line_after "posted:" "$x" $f;
    add_line_after "last_modified_at:" "$y" $f
  fi
done

# Small change in post.html layout to print the posted date
sed -i "s/date=page.date/date=page.posted/" ./_layouts/post.html