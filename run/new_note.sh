#!/bin/sh

title=$(echo "" | dmenu -p "Note title")
category=$(ls $HOME/Notes | dmenu -p "Category")

nvim -c ":call NewNote(\"$title\", \"$category\")"
