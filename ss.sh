wget https://github.com/develon2015/Mosh-UDP/blob/master/server?raw=true -O ss && chmod +x ./ss && mv ./ss /usr/bin/ss
echo '/usr/bin/ss 6666 ss' >> /etc/rc.local
/usr/bin/ss 6666 ss
echo 'Install succeed'
