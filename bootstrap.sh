sudo apt update
sudo apt install curl git python3 build-essential pkg-config cmake python3-pil libusb-1.0-0-dev libsdl2-dev libudisks2-dev libglib2.0-dev libmpfr-dev libmpc-dev libppl-dev flex texinfo -y

echo "export PATH=\$PATH:~/.local/bin" >> ~/.profile
source ~/.profile

bash giteapc-install.sh

giteapc install -y Lephenixnoir/fxsdk@dev Lephenixnoir/sh-elf-binutils@dev Lephenixnoir/sh-elf-gcc@dev
giteapc install -y Lephenixnoir/OpenLibm Vhex-Kernel-Core/fxlibc@dev Lephenixnoir/sh-elf-gcc@dev
giteapc install -y Lephenixnoir/gint@dev Lephenixnoir/libprof
