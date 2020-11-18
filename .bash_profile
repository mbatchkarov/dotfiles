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
        git fetch origin "pull/$1/head:pr/$1";
        git checkout "pr/$1";
}

cleanup(){
	sudo journalctl --vacuum-time=10d
	rm -rf /home/miro/snap/spotify/common/.cache/
	rm -rf /home/miro/.cache/.Cypress
	sudo apt-get clean
	sudo rm -rf /var/cache/apt

	LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
        while read snapname revision; do
            sudo snap remove "$snapname" --revision="$revision"
        done

}
