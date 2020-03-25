#!/bin/bash
function installRedsocks() {
	if apt -v; then
		sudo apt install redsocks -y;
		configure;
	fi
}

function configure() {
	echo "正在配置...";
echo "base {
        // debug: connection progress & client list on SIGUSR1
        log_debug = off;

        // info: start and end of client session
        log_info = on;

        /* possible \`log\' values are:
         *   stderr
         *   \"file:/path/to/file\"
         *   syslog:FACILITY  facility is any of \"daemon\", \"local0\"...\"local7\"
         */
        log = \"syslog:daemon\";

        // detach from console
        daemon = on;

        /* Change uid, gid and root directory, these options require root
         * privilegies on startup.
         * Note, your chroot may requre /etc/localtime if you write log to syslog.
         * Log is opened before chroot & uid changing.
         */
        user = redsocks;
        group = redsocks;
        // chroot = \"/var/chroot\";

        /* possible \`redirector\' values are:
         *   iptables   - for Linux
         *   ipf        - for FreeBSD
         *   pf         - for OpenBSD
         *   generic    - some generic redirector that MAY work
         */
        redirector = iptables;
}

redsocks {
        /* \`local_ip\' defaults to 127.0.0.1 for security reasons,
         * use 0.0.0.0 if you want to listen on every interface.
         * \`local_*\' are used as port to redirect to.
         */
        local_ip = 127.0.0.1;
        local_port = 12345;

        // \`ip\' and \`port\' are IP and tcp-port of proxy-server
        // You can also use hostname instead of IP, only one (random)
        // address of multihomed host will be used.

        // m
        ip = 89.208.241.19;
        port = 3306;

        // known types: socks4, socks5, http-connect, http-relay
        type = socks5;

        // login = \"foobar\";
        // password = \"baz\";
}" > /tmp/redsocks.conf;

	sudo mv /tmp/redsocks.conf /etc/;
	sudo vi /etc/redsocks.conf;
	sudo service redsocks restart;
}

echo "检查redsocks是否已安装...";
if ! redsocks -v; then
	echo "按回车键开始安装";
	read;
	echo "开始安装...";
	installRedsocks;
fi

echo "检查ssrsetup脚本...";
if ! type ssrsetup; then
	echo "开始下载脚本";
	git clone https://github.com/develon2015/mysocks5.git;
	cd mysocks5 && sudo make install;
	sudo vi $(which ssrsetup);
fi

