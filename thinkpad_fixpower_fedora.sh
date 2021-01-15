#!/bin/sh

echo 'mem_sleep_default=deep' | sudo tee -a /etc/default/grub
grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=suspend/g' /etc/systemd/logind.conf
sed -i 's/#HandleLidSwitchExternalPower=suspend/HandleLidSwitchExternalPower=suspend/g' /etc/systemd/logind.conf
