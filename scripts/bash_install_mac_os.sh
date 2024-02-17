#!/usr/bin/env bash

# Install Bash 5.0 (MacOS)
VERSION="5.2"
BASH_SHORT="bash-$VERSION"
BASH_SRC="$BASH_SHORT.tar.gz"
BASH_URL="https://ftp.gnu.org/gnu/bash"
BASH_PREFIX="/usr/local"
BASH_PATH="$BASH_PREFIX/bin/bash"

# initial setup
cd ~/
curl -Ok $BASH_URL/$BASH_SRC
tar -zxvf $BASH_SRC

mv $BASH_SHORT .bash && cd .bash/
./configure --prefix=$BASH_PREFIX && make && sudo make install

printf "\nInstalled bash'es:\n"
which -a bash

printf "\nWhitelisting the new bash...\n" 
grep -q $BASH_PATH /private/etc/shells || echo $BASH_PATH | sudo tee -a /private/etc/shells

printf "\nSetting default shell:\n" 
chsh -s $BASH_PATH
sudo chsh -s $BASH_PATH

printf "\nCreating uninstaller..."
touch bash_uninstall
cat > bash_uninstall <<EOF
#!/usr/bin/env bash
cd ~/.bash
sudo make uninstall clean
printf "\nCleaning whitelist...\n"
sed /$(sed 's:/:\\/:g' <<< $BASH_PATH)/d /private/etc/shells
printf "\nRemoving leftovers...\n"
rm -rf ~/.bash && cd ~/
printf "\nSetting old bash back...\n"
chsh -s /bin/bash
sudo chsh -s /bin/bash
printf "\nInstalled bash'es:\n"
which -a bash
printf "\nOld bash is back!\n"
EOF
chmod +x bash_uninstall

printf "\nCleaning source: "
cd ~/ && rm -vf $BASH_SRC

printf "\n\nExit terminal and reopen to start using $BASH_SHORT\nTo uninstall it and revert to old:\n~/.bash/bash_uninstall\n"
exit
