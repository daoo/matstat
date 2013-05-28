#!/usr/bin/env bash

rev_file="build/revision"
tex_file="build/dist.tex"

if [[ -f $rev_file ]]; then
  revision="$(< $rev_file)"
  let "new_rev = $revision + 1"
else
  new_rev=0
fi

sed -i "s/rev DEVELOPMENT/rev $new_rev/" $tex_file

echo -n $new_rev > $rev_file
