#!/bin/bash
#Authors:
# `Shawn O'Leary <https://www.facebook.com/shaunmichelle1>` -- Main author
# `Dave Faulkmore <https://www.facebook.com/faulkmore/>` -- XDG user folder standard compliance

#Setup $HOME/common folder and permissions
#A more flexible technique to set permissions is to use ACL (Linux Access Control List) rather than chown
[[ -z "$USER" ]] && USER=$(/bin/logname) ||:
[[ ! -d "$HOME/common" ]] && /bin/sudo /bin/mkdir "$HOME/common" ||:
[[ -d "$HOME/common" ]] && /bin/sudo /bin/chown "${USER}:${USER}" "$HOME/common" ||:

#Create all user settings folders
builtin cd "$HOME/common"
/bin/mkdir -p .cache/lutris .cache/mozilla .cache/wine .cache/winetricks .config/lutris .mozilla .local/share/lutris Games
builtin cd -- >/dev/null
builtin declare -a folders=($(xdg-user-dir DOCUMENTS) $(xdg-user-dir DOWNLOAD) $(xdg-user-dir MUSIC) $(xdg-user-dir PICTURES) $(xdg-user-dir PUBLICSHARE) $(xdg-user-dir TEMPLATES) $(xdg-user-dir VIDEOS))
for i in folders[$@]; do
  /bin/mkdir -p "$HOME/common/${i##*/}"
done
builtin unset folders

#Delete existing /home/$USER/.cache folder
builtin declare -a deletecache=(/home/$USER/.cache/lutris /home/$USER/.cache/mozilla /home/$USER/.cache/wine /home/$USER/.cache/winetricks)
for i in deletecache[$@]; do
  [[ -d "$i" ]] && /bin/rm -rf --preserve-root $i ||:
done
/bin/rm -rf --preserve-root /home/$USER/.config/lutris /home/$USER/.mozilla /home/$USER/.local/share/lutris

#Delete XDG standard localized folders
builtin declare -a deleteme=($(xdg-user-dir DOCUMENTS) $(xdg-user-dir DOWNLOAD) $(xdg-user-dir MUSIC) $(xdg-user-dir PICTURES) $(xdg-user-dir PUBLICSHARE) $(xdg-user-dir TEMPLATES) $(xdg-user-dir VIDEOS))
for i in deleteme[$@]; do
  [[ -d "$i" ]] && /bin/rm -fr --preserve-root $i ||:
done
builtin unset deleteme

#Non-standard not localized user settings folder
#Possible to create a custom XDG localized folder; maybe not worth the effort
[[ -d "/home/$USER/Games" ]] && /bin/rm -rf --preserve-root  "/home/$USER/Games" ||:

#Create symlinks to these common user settings folders
builtin cd /home/$USER/.cache
/bin/ln -s /home/common/.cache/lutris .
/bin/ln -s /home/common/.cache/mozilla .
/bin/ln -s /home/common/.cache/wine .
/bin/ln -s /home/common/.cache/winetricks .
builtin cd -- >/dev/null

builtin cd /home/$USER/.config
/bin/ln -s /home/common/.config/lutris .
builtin cd -- >/dev/null

builtin cd /home/$USER/.local/share
/bin/ln -s /home/common/.local/share/lutris .
builtin cd -- >/dev/null

builtin cd /home/$USER
/bin/ln -s /home/common/.mozilla
/bin/ln -s /home/common/Documents
/bin/ln -s /home/common/Downloads
/bin/ln -s /home/common/Music
/bin/ln -s /home/common/Pictures
/bin/ln -s /home/common/Public
/bin/ln -s /home/common/Templates
/bin/ln -s /home/common/Videos
#Non-standard, create custom folder
/bin/ln -s /home/common/Games
builtin cd -- >/dev/null

exit 0
