CONFIG=".config" 
NVIM="nvim"

DIR_LOCATION=$PWD

# install_software() {
# 	sudo pacman -S tmux
# 	sudo pacman -S nvim
# 	sudo pacman -S zsh
# }

setup() {
	cp $DIR_LOCATION/.tmux.conf ~/
	cp $DIR_LOCATION/.zshrc ~/
	cp -r $DIR_LOCATION/nvim ~/$CONFIG
}

create_config_dir() {
	cd
	mkdir $CONFIG 
}

create_nvim_dir() {
	mkdir ~/$CONFIG/$NVIM
}

if [ ! -d "/home/$USER/$CONFIG" ]
	then
	create_config_dir
	if [ ! -d "/home/$USER/$CONFIG/$NVIM" ] 
	then
		create_nvim_dir
		setup
	else
		setup
	fi
else
	setup
fi
