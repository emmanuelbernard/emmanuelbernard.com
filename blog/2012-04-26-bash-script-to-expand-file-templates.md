---
title: Bash script to expand file templates
author: 'Emmanuel Bernard'
layout: blog-post
tags: [ tool ]
---

I am working on pushing all my "dotfiles" into a Git repo. Some contains passwords
or other private data. It took me longer than expected to write an expander script
in bash. So here it is.

Properties are stored as Java properties.

    gittoken=123456789012345ab3bc
    backup_destination=emmanuel@devnull.com:./backup

The template uses the `$placeholder` syntax.

    # .gitconfig file
    [user]
        name = Emmanuel Bernard
    [github]
        user = emmanuelbernard
        token = $gittoken 
    [alias]
        co = checkout
        undo = reset --hard
        cb = checkout -b
        br = branch
        cp = cherry-pick
    [random]
        complex-backup-link = $backup_destination

The script is used like

    ./properties-expander.sh <properties file> <template> <destination>

    # For example
    ./properties-expander.sh ~/secret.properties ~/templates/gitconfig ~/.gitconfig

The script itself is fairly compact though some parts were fairly tricky 
- thanks [stackoverflow][stackoverflow] :) :

    #!/bin/bash
    #
    # Released under the WTFPL license version 2 http://sam.zoy.org/wtfpl/
    # Copyright (c) 2012 Emmanuel Bernard
    # -----
    # Usage: properties-expander.sh <properties file> <template> <destination>
    #
    # Properties file:
    #   PROPERTY1=value1
    #   PROPERTY2=value2

    #help
    if [[ $# -ne 3 ]]; then 
      echo "properties-expander.sh <properties file> <template> <destination>"
      exit 0;
    fi

    echo Expanding $2 to $3 with properties from $1

    #read each line including the last one
    while IFS=$'\n' read -r line || [[ -n "$line" ]]; do
        #get the property name before the first =
        property=${line%%=*}
        #get the value after the first =
        value=${line#*=}

        #find a suitable separation character as the value might contain /
        candidates='/:.|@#%^&;,!~abcABC'  # candidates for separation character
        char=$(echo "$candidates" | tr -d "$line")  
        char=${char:0:1}   # choose the first candidate that doesn't appear in the user input

        if [ -z "$char" ]    # this test checks for exhaustion of the candidate character set
        then
            echo "Unusable user input: $line"
            exit 1
        fi

        #add regexp rule
        SEDEXEC="s${char}\$$property${char}$value${char}g;$SEDEXEC"
    done < $1

    SEDEXEC="sed -e '$SEDEXEC' $2 > $3"
    eval $SEDEXEC

For simplicity, I have put the script in a GitHub [gist][gist]. Please fork, improve and 
give me feedback :)

[gist]: https://gist.github.com/2500305
[stackoverflow]: http://stackoverflow.com