#!bin/bash

#install only if does not exist
if [ ! -e "$HOME/.bashtian" ]
then
    #create the instalation folder
    INSTALL_DIR="$HOME/.bashtian";
    mkdir -p "$INSTALL_DIR";

    #copy shell scripts to the install directory
    cp gitit.sh "$INSTALL_DIR";
    cp full_update.sh "$INSTALL_DIR";

    #setup the aliases
    gitit_alias="$INSTALL_DIR/gitit.sh";
    full_update_alias="$INSTALL_DIR/full_update.sh";

    #check if bashrc exists and append the aliases
    if [ -f "$HOME/.bashrc" ]
    then
        APPEND_RC="$HOME/.bashrc";
        echo "#Bashtian aliases" >> "$APPEND_RC";
        echo "alias gitit='$gitit_alias'" >> "$APPEND_RC";
        echo "alias full-update='$full_update_alias'" >> "$APPEND_RC";
    fi

    #check if zshrc exists and append the aliases
    if [ -f "$HOME/.zshrc" ]
    then
        APPEND_RC="$HOME/.zshrc"
        echo "#Bashtian aliases" >> "$APPEND_RC";
        echo "alias gitit='$gitit_alias'" >> "$APPEND_RC";
        echo "alias full-update='$full_update_alias'" >> "$APPEND_RC";
    fi

    #refresh the rc file of the current shell
    if [ "$SHELL" = "/bin/zsh" ]; then source "$HOME/.zshrc"; fi
    if [ "$SHELL" = "bash" ]; then source "$HOME/.bashrc"; fi
fi
