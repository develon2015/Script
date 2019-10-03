SHELL = /bin/bash #设置bash为执行shell, 否则默认为sh

.PHONY: help
help:
	@echo 帮助信息
	@echo "	1. sudo make kotlin ->" 'You can get kotlin expansion script, deploy to /bin'

kotlin: jk kc
	@value=$$(uname);\
	if [ "$$value" == "Linux" ]; then \
		cp jk kc /bin/;\
	fi
	@echo 部署了kotlin扩展脚本
	@ls /bin/jk /bin/kc -lih

.PHONY: clean
	rm 
