CONFIG=".ttest" 
NVIM="nvim"

DIR_LOCATION=$PWD

setup() {
	cp $DIR_LOCATION/.tmux.conf ~/
	cp $DIR_LOCATION/.zshrc ~/
	cp -r $DIR_LOCATION/nvim ~/$CONFIG
	echo "setup"
}

create_config_dir() {
	cd
	mkdir $CONFIG 
	echo "create config dir"
}

create_nvim_dir() {
	mkdir ~/$CONFIG/$NVIM
	echo "create nvim dir"
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
