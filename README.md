# shadowsocksR-oneclick一键式安装脚本

本脚本修改于 teddysun 的一键脚本： https://shadowsocks.be/9.html

#安装方法：
----
wget https://raw.githubusercontent.com/Sherlockwoo/shadowsocksR_1nstall/master/shadowsocksR.sh && bash shadowsocksR.sh
   
#卸载方法：
----   
bash ./shadowsocksR.sh uninstall

升级方法：

cd /usr/local/shadowsocks/shadowsocks
git pull
1
2
cd /usr/local/shadowsocks/shadowsocks
git pull

使用命令：
启动： /etc/init.d/shadowsocks start
停止： /etc/init.d/shadowsocks stop
重启： /etc/init.d/shadowsocks restart
状态： /etc/init.d/shadowsocks status

配置文件路径： /etc/shadowsocks.json
日志文件路径： /var/log/shadowsocks.log
安装路径： /usr/local/shadowsocks/shadowsoks
