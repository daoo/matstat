#!/usr/bin/env bash

rev_file="build/revision"

revision="$(cat $rev_file)"
let "new_rev = $revision + 1"

sed -i "s/rev DEVELOPMENT/rev $new_rev/" build/dist.tex

echo -n $new_rev > $rev_file
