# Script

## Reinstall

```
sudo su
wget --no-check-certificate -qO ~/Network-Reinstall-System-Modify.sh 'https://www.cxthhhhh.com/CXT-Library/Network-Reinstall-System-Modify/Network-Reinstall-System-Modify.sh' && chmod a+x ~/Network-Reinstall-System-Modify.sh && bash ~/Network-Reinstall-System-Modify.sh -UI_Options
```

Password: `cxthhhhh.com`

## Ubuntu setup

```
apt update && apt install -y curl wget && wget https://raw.githubusercontent.com/develon2015/Script/master/ubuntu_setup.sh && bash ubuntu_setup.sh
```

## Enable bbr

```
sudo su
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
sysctl net.ipv4.tcp_available_congestion_control
lsmod | grep bbr
```


## Goflyway
> wget https://raw.githubusercontent.com/develon2015/Script/master/goflyway.sh -O goflyway.sh && chmod +x goflyway.sh && ./goflyway.sh <br/>

最新版本 项目地址<a href="https://www.github.com/ToyoDAdoubi/doubi">ToyoDADoubi/doubi</a>
> wget https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/goflyway.sh -O goflyway.sh && chmod +x goflyway.sh && ./goflyway.sh  <br/>

客户端
```
wget 'https://github.com/coyove/goflyway/releases/download/2.0.0rc1/goflyway_linux_amd64.tar.gz'
tar xvf goflyway_linux_amd64.tar.gz
./goflyway -up="服务器IP:服务器端口" -k="密码" -l="0.0.0.0:客户端端口" -g -U=http
```


## bbr
最新版本 项目地址:

* [chiakge/Linux-NetSpeed](https://github.com/chiakge/Linux-NetSpeed)
* [cx9208/Linux-NetSpeed](https://github.com/cx9208/Linux-NetSpeed)

> wget "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh<br>

## ssrmu

* [ToyoDAdoubi/doubi](https://github.com/ToyoDAdoubi/doubi)
> wget https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssrmu.sh && chmod +x ./ssrmu.sh && sudo ./ssrmu.sh

## ss
> wget https://raw.githubusercontent.com/develon2015/Script/master/ss.sh -O ss.sh && chmod +x ./ss.sh && ./ss.sh && rm -rf ./ss.sh


