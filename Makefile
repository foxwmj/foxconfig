copy:
	@echo
	@echo "--------------- gitconfig ---------------";
	@echo
	[ -f ~/.gitconfig ] \
		&& cp -i ~/.gitconfig ~/.gitconfig.bak;
	cp -i .gitconfig ~/.gitconfig;
	@echo
	@echo "--------------- bash scripts ---------------";
	@echo
	[ -d ~/.bash ] \
		&& ([ -d ~/.bash.bak ] || mkdir ~/.bash.bak) \
		&& cp -i ~/.bash/* ~/.bash.bak/;
	cp -i -r .bash ~;
	@echo
	@echo "--------------- bashrc---------------";
	@echo
	grep -q "source ~/.bash/bash_profile" ~/.bashrc || ( \
		echo "\n#############################" 	>> ~/.bashrc && \
		echo "# Added by Mingjin"		>> ~/.bashrc && \
		echo "#############################" 	>> ~/.bashrc && \
		echo "[ -f ~/.bash/bash_profile ] && source ~/.bash/bash_profile" >> ~/.bashrc)
	@echo
	@echo "--------------- tmux ---------------";
	@echo
	[ -f ~/.tmux.conf ] \
		&& cp -i ~/.tmux.conf ~/.tmux.conf.bak;
	cp -i .tmux.conf ~/.tmux.conf;
