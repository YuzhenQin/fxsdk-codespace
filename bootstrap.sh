sudo apt install curl git python3 build-essential pkg-config -y
sudo apt install cmake python3-pil libusb-1.0-0-dev libsdl2-dev libudisks2-dev libglib2.0-dev -y
echo "export PATH=\$PATH:~/.local/bin" >> ~/.profile
source ~/.profile
curl "https://gitea.planet-casio.com/Lephenixnoir/GiteaPC/raw/branch/master/install.sh" -o /tmp/giteapc-install.sh && bash /tmp/giteapc-install.sh
giteapc install Lephenixnoir/fxsdk Lephenixnoir/sh-elf-binutils Lephenixnoir/sh-elf-gcc
giteapc install Lephenixnoir/OpenLibm Vhex-Kernel-Core/fxlibc Lephenixnoir/sh-elf-gcc
giteapc install Lephenixnoir/gint Lephenixnoir/libprof
