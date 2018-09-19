# apple keyboard: make F1-F12 keys work as such, not as media keys
sudo bash -c "echo 2 > /sys/module/hid_apple/parameters/fnmode"

# elastic search won't run in docker sometimes
sudo sysctl -w vm.max_map_count=262144

# ubuntu 18.04 can't connect to ethernet unless driver is reloaded
# see https://askubuntu.com/questions/1029250/ubuntu-18-04-ethernet-disconnected-after-suspend
sudo  modprobe -r r8169 # remove
sudo  modprobe -i r8169 # install again, ignoring existing installation

alias vi=vim
alias ls="ls -lah"
alias ipy="ipython"
alias k="kubectl"
  

pull(){
        echo Fetching PR "$1";
        git fetch upstream "pull/$1/head:pr/$1";
        git checkout "pr/$1";
}

prune(){
   git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
}
