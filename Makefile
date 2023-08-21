.DEFAULT_GOAL := help
help:
	@grep "^\w\+\s\?:" Makefile
copy:
	@echo
	@echo "--------------- gitconfig ---------------";
	@echo
	if [ -f ~/.gitconfig ]; then  \
		cp -i ~/.gitconfig ~/.gitconfig.bak; \
	fi
	cp -f .gitconfig ~/.gitconfig;
	@echo
	@echo "--------------- bash scripts ---------------";
	@echo
	if [ -d ~/.bash ]; then \
		([ -d ~/.bash.bak ] || mkdir ~/.bash.bak) \
		&& cp -i ~/.bash/* ~/.bash.bak/; \
	fi
	cp -rf .bash ~;
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
	if [ -f ~/.tmux.conf ]; then \
		cp -i ~/.tmux.conf ~/.tmux.conf.bak; \
	fi
	cp -f .tmux.conf ~/.tmux.conf;
