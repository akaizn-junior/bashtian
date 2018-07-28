#!/bin/bash

#run some basic git commands

#first, show the repository status
git status
#pull from the repo to check for potential remote changes
echo "Do you wanna pull the repo?"
select pyn in Yes No;
do
    case $pyn in
    Yes ) echo "Sure"; git pull origin break;;
    No ) echo "Ok. Skipped Pull."; break;;
    esac
done
#resolve any merge problems
echo "merge issues?"
select myn in Yes No;
do
    case $myn in
    Yes )
    echo "Ok, Ill try and open vscode, so you can edit."
    echo "Otherwise, fix the conflicts and run gitit afterwards. bye"
    #check if code is a command in the $PATH and it is executable
    if [ -x "$(command -v code)" ];
    then code .; exit;
    else exit;
    fi
    break;;
    No ) echo "Great, continue."; break;;
    esac
done
#stage all changes
echo "Staging All changes..."
git add .
echo "All changes staged."
#commit the changes
echo "Write a clear and descriptive commit message:"
read commitmsg
git commit -m "$commitmsg"
#tag commit
echo "Do you wanna tag this commit?"
select tyn in Yes No;
do
    case $tyn in
    Yes )
        echo "Sure. Whats te tag:";
        read tagname;
        #Tag commit
        git tag "$tagname"
        #push tag to the repo
        git push --tags
        break;;
    No ) echo "Ok. Skipped tagging."; break;;
    esac
done
#push changes to repository
echo "Push changes"
git push -u
