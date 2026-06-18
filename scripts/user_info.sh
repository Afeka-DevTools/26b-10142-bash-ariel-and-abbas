#!/bin/bash
# Shows info about the current user: name, home, groups, shell
echo "Name:   $(whoami)"
echo "Home:   $HOME"
echo "Groups: $(groups)"
echo "Shell:  $SHELL"