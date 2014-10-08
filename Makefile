DOTFILES := $(shell pwd)

all: dotfiles crossplatform platform

crossplatform:
		sh $(DOTFILES)/script/generic.sh

platform:
		sh $(DOTFILES)/script/platform.sh

dotfiles:
		sh $(DOTFILES)/script/bootstrap.sh
