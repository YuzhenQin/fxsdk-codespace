#! /usr/bin/env bash

TAG=$(printf "\x1b[36m<giteapc>\x1b[0m")
PREFIX=${GITEAPC_PREFIX:-$HOME/.local}
URL="https://gitea.planet-casio.com/Lephenixnoir/GiteaPC/archive/master.tar.gz"

# Download the source code

cd "$(mktemp -d)"
curl "$URL" -o giteapc-master.tar.gz
tar -xzf giteapc-master.tar.gz && cd giteapc

# Bootstrap the program by installing it with itself (allowing updates)

python3 giteapc.py install -y Lephenixnoir/GiteaPC

# Check whether the bin folder is already in the PATH

if [[ ":$PATH:" =~ ":$PREFIX/bin:" ]]; then
  echo "$TAG $PREFIX/bin is already in your PATH, we're good to go!"
  exit 0
fi

# Try to find a suitable startup file to extend the PATH in

default="$HOME/.profile"
candidates=".bashrc .zshrc .bash_profile .profile .zprofile"

for c in $candidates; do
  [[ -f "$HOME/$c" ]] && default="$HOME/$c"
done

# Suggest to add the path to binaries to the PATH at startup

cat <<EOF
$TAG In order to use programs installed by GiteaPC, you will need to add their
$TAG install folder to your PATH. This can be done automatically when you log
$TAG in by adding the following command to your startup file:
$TAG
$TAG   export PATH="\$PATH:$PREFIX/bin"
$TAG
$TAG -> Press Enter to add this command to $default, or
$TAG -> Type another file name to add this command to, or
$TAG -> Type "-" to skip setting the PATH entirely.
EOF

read -p "> " startup_file
[[ -z "$startup_file" ]] && startup_file=$default

if [[ "$startup_file" == "-" ]]; then
  echo "$TAG Skipped setting the PATH."
else
  echo "export PATH=\"\$PATH:$PREFIX/bin\"" >> $startup_file
  echo "$TAG Set the PATH in $startup_file, this will take effect next login."
fi
