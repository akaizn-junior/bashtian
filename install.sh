#!bin/bash

#the instalation folder path
INSTALL_DIR="$HOME/.bashtian";

#setup the path of the scripts
gitit_path="$INSTALL_DIR/gitit.sh";
full_update_path="$INSTALL_DIR/full_update.sh";

#install only if does not exist
if [ ! -e "$HOME/.bashtian" ]
then
    #create the instalation folder
    mkdir -p "$INSTALL_DIR";

    #copy shell scripts to the install directory
    cp gitit.sh "$INSTALL_DIR";
    cp full_update.sh "$INSTALL_DIR";

    #check if bashrc exists and append aliases
    if [ -f "$HOME/.bashrc" ]
    then
        APPEND_RC="$HOME/.bashrc";
        echo "#Bashtian aliases" >> "$APPEND_RC";
        echo "alias gitit='$gitit_path'" >> "$APPEND_RC";
        echo "alias full-update='$full_update_path'" >> "$APPEND_RC";
    fi

    #check if zshrc exists and append aliases
    if [ -f "$HOME/.zshrc" ]
    then
        APPEND_RC="$HOME/.zshrc"
        echo "#Bashtian aliases" >> "$APPEND_RC";
        echo "alias gitit='$gitit_path'" >> "$APPEND_RC";
        echo "alias full-update='$full_update_path'" >> "$APPEND_RC";
    fi

    #refresh the rc file of the current shell
    if [ "$SHELL" = "/bin/zsh" ]; then source "$HOME/.zshrc"; fi
    if [ "$SHELL" = "bash" ]; then source "$HOME/.bashrc"; fi

echo '                                                          ';
echo ' _______                                                  ';
echo '|   _   \ ______                                          ';
echo '|  | |  /   _   |           _______          __     _     ';
echo '|  |_| |   | |  |______     \__    _\ _     |  |   | |    ';
echo '|   _   \  |_|  |  ____| ___|  |  |  | |____|   \__| |    ';
echo '|  | |   |  _   | [____  ___   |  |  | |  _ \        |    ';
echo '|  |_|   / | |  |   O  |    |  |  |  | | |_| |   _   |    ';
echo '|______ /  | |  |  ____/    |  |  |  |_|   __|  | |__|    ';
echo '';
echo '';
echo 'Installed Successfully!';
else
    #if it exists, update
    #first remove the existing scripts
    rm "$gitit_path";
    rm "$full_update_path";

    #copy the new shell scripts to the install directory
    cp gitit.sh "$INSTALL_DIR";
    cp full_update.sh "$INSTALL_DIR";

echo '                                                          ';
echo ' _______                                                  ';
echo '|   _   \ ______                                          ';
echo '|  | |  /   _   |           _______          __     _     ';
echo '|  |_| |   | |  |______     \__    _\ _     |  |   | |    ';
echo '|   _   \  |_|  |  ____| ___|  |  |  | |____|   \__| |    ';
echo '|  | |   |  _   | [____  ___   |  |  | |  _ \        |    ';
echo '|  |_|   / | |  |   O  |    |  |  |  | | |_| |   _   |    ';
echo '|______ /  | |  |  ____/    |  |  |  |_|   __|  | |__|    ';
echo '';
echo '';
echo 'Updated Successfully!';
fi
