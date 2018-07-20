# apple keyboard: make F1-F12 keys work as such, not as media keys
sudo bash -c "echo 2 > /sys/module/hid_apple/parameters/fnmode"

# elastic search won't run in docker sometimes
sudo sysctl -w vm.max_map_count=262144

# ubuntu 18.04 can't connect to ethernet unless driver is reloaded
# see https://askubuntu.com/questions/1029250/ubuntu-18-04-ethernet-disconnected-after-suspend
sudo  modprobe -i r8169
