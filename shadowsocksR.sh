#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#=================================================================#
#   System Required:  CentOS 6,7, Debian, Ubuntu                  #
#   Description: One click Install ShadowsocksR Server            #
#   Author: Sherlockwoo                                                 #
#   Thanks: @breakwa11 <https://twitter.com/breakwa11>            #
#   Thanks: @Teddysun <i@teddysun.com>                            #
#   Intro:  https://shadowsocks.be/9.html                         #
#=================================================================#
rm -f SSR
clear
echo -e "\033[34m================================================================\033[0m

\033[31m                     欢迎使用shadowsocksR一键脚本                         \033[0m

\033[31m              本脚本仅供个人学习交流使用，请勿用于非法用途！                 \033[0m

\033[31m                                                   By:Sherlockwoo        \033[0m

\033[31m                             Starting Now...                             \033[0m
\033[34m================================================================\033[0m";
echo

echo

#Current folder
cur_dir=`pwd`
# Get public IP address
IP=$(ip addr | egrep -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | egrep -v "^192\.168|^172\.1[6-9]\.|^172\.2[0-9]\.|^172\.3[0-2]\.|^10\.|^127\.|^255\.|^0\." | head -n 1)
if [[ "$IP" = "" ]]; then
    IP=$(wget -qO- -t1 -T2 ipv4.icanhazip.com)
fi

# Make sure only root can run our script
function rootness(){
    if [[ $EUID -ne 0 ]]; then
       echo "Error:This script must be run as root!" 1>&2
       exit 1
    fi
}

# Check OS
function checkos(){
    if [ -f /etc/redhat-release ];then
        OS='CentOS'
    elif [ ! -z "`cat /etc/issue | grep bian`" ];then
        OS='Debian'
    elif [ ! -z "`cat /etc/issue | grep Ubuntu`" ];then
        OS='Ubuntu'
    else
        echo "Not support OS, Please reinstall OS and retry!"
        exit 1
    fi
}

# Get version
function getversion(){
    if [[ -s /etc/redhat-release ]];then
        grep -oE  "[0-9.]+" /etc/redhat-release
    else    
        grep -oE  "[0-9.]+" /etc/issue
    fi    
}

# CentOS version
function centosversion(){
    local code=$1
    local version="`getversion`"
    local main_ver=${version%%.*}
    if [ $main_ver == $code ];then
        return 0
    else
        return 1
    fi        
}

# Disable selinux
function disable_selinux(){
if [ -s /etc/selinux/config ] && grep 'SELINUX=enforcing' /etc/selinux/config; then
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
    setenforce 0
fi
}

# Pre-installation settings
function pre_install(){
    # Not support CentOS 5
    if centosversion 5; then
        echo "Not support CentOS 5, please change OS to CentOS 6+/Debian 7+/Ubuntu 12+ and retry."
        exit 1
    fi
    # Set ShadowsocksR config password
    echo "请输入SSR连接密码:"
    read -p "(默认密码: sherlockwoo5):" shadowsockspwd
    [ -z "$shadowsockspwd" ] && shadowsockspwd="sherlockwoo5"
    echo
    echo "---------------------------"
    echo "password = $shadowsockspwd"
    echo "---------------------------"
    echo
    # Set ShadowsocksR config port
    while true
    do
    echo -e "请输入SSR连接端口,不设置将默认138端口:"
    read -p "(默认自动设置SSR端口为138):" shadowsocksport
    [ -z "$shadowsocksport" ] && shadowsocksport="138"
    expr $shadowsocksport + 0 &>/dev/null
    if [ $? -eq 0 ]; then
        if [ $shadowsocksport -ge 1 ] && [ $shadowsocksport -le 65535 ]; then
            echo
            echo "---------------------------"
            echo "port = $shadowsocksport"
            echo "---------------------------"
            echo
            break
        else
            echo "输入错误，请输入1-65535之间的数字！"
        fi
    else
        echo "输入错误，请输入1-65535之间的数字！"
    fi
    done
    get_char(){
        SAVEDSTTY=`stty -g`
        stty -echo
        stty cbreak
        dd if=/dev/tty bs=1 count=1 2> /dev/null
        stty -raw
        stty echo
        stty $SAVEDSTTY
    }
    echo
    echo "请按下回车键继续or按 Ctrl+C 退出"
    char=`get_char`
    # Install necessary dependencies
    if [ "$OS" == 'CentOS' ]; then
        yum install -y wget unzip openssl-devel gcc swig python python-devel python-setuptools autoconf libtool libevent git ntpdate
        yum install -y m2crypto automake make curl curl-devel zlib-devel perl perl-devel cpio expat-devel gettext-devel
    else
        apt-get -y update
        apt-get -y install python python-dev python-pip python-m2crypto curl wget unzip gcc swig automake make perl cpio build-essential git ntpdate
    fi
    cd $cur_dir
}

# Download files
function download_files(){
    # Download libsodium file
    if ! wget --no-check-certificate -O libsodium-1.0.12.tar.gz https://github.com/jedisct1/libsodium/releases/download/1.0.12/libsodium-1.0.12.tar.gz; then
        echo "Failed to download libsodium file!"
        exit 1
    fi
    # Download ShadowsocksR file
    # if ! wget --no-check-certificate -O manyuser.zip https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip; then
        # echo "Failed to download ShadowsocksR file!"
        # exit 1
    # fi
    # Download ShadowsocksR chkconfig file
    if [ "$OS" == 'CentOS' ]; then
        if ! wget --no-check-certificate https://raw.githubusercontent.com/Sherlockwoo/shadowsocksR-1nstall/master/shadowsocksR -O /etc/init.d/shadowsocks; then
            echo "Failed to download ShadowsocksR chkconfig file!"
            exit 1
        fi
    else
        if ! wget --no-check-certificate https://raw.githubusercontent.com/Sherlockwoo/shadowsocksR-1nstall/master/shadowsocksR-debian -O /etc/init.d/shadowsocks; then
            echo "Failed to download ShadowsocksR chkconfig file!"
            exit 1
        fi
    fi
}

# firewall set
function firewall_set(){
    echo "firewall set start..."
    if centosversion 6; then
        /etc/init.d/iptables status > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            iptables -L -n | grep '${shadowsocksport}' | grep 'ACCEPT' > /dev/null 2>&1
            if [ $? -ne 0 ]; then
                iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport ${shadowsocksport} -j ACCEPT
                iptables -I INPUT -m state --state NEW -m udp -p udp --dport ${shadowsocksport} -j ACCEPT
                /etc/init.d/iptables save
                /etc/init.d/iptables restart
            else
                echo "port ${shadowsocksport} has been set up."
            fi
        else
            echo "WARNING: iptables looks like shutdown or not installed, please manually set it if necessary."
        fi
    elif centosversion 7; then
        systemctl status firewalld > /dev/null 2>&1
        if [ $? -eq 0 ];then
            firewall-cmd --permanent --zone=public --add-port=${shadowsocksport}/tcp
            firewall-cmd --permanent --zone=public --add-port=${shadowsocksport}/udp
            firewall-cmd --reload
        else
            echo "Firewalld looks like not running, try to start..."
            systemctl start firewalld
            if [ $? -eq 0 ];then
                firewall-cmd --permanent --zone=public --add-port=${shadowsocksport}/tcp
                firewall-cmd --permanent --zone=public --add-port=${shadowsocksport}/udp
                firewall-cmd --reload
            else
                echo "WARNING: Try to start firewalld failed. please enable port ${shadowsocksport} manually if necessary."
            fi
        fi
    fi
    echo "firewall set completed..."
}

# Config ShadowsocksR
function config_shadowsocks(){
    cat > /etc/shadowsocks.json<<-EOF
{
    "server": "0.0.0.0",
    "server_ipv6": "::",
    "server_port": ${shadowsocksport},
    "local_address": "127.0.0.1",
    "local_port": 1081,
    "password": "${shadowsockspwd}",
    "timeout": 120,
    "udp_timeout": 60,
    "method": "chacha20",
    "protocol": "auth_sha1_compatible",
    "protocol_param": "",
    "obfs": "http_simple_compatible",
    "obfs_param": "",
    "dns_ipv6": false,
    "connect_verbose_info": 0,
    "redirect": "",
    "fast_open": false,
    "workers": 1

}
EOF
}

# Install ShadowsocksR
function install_ss(){
    # Install libsodium
    tar zxf libsodium-1.0.12.tar.gz
    cd $cur_dir/libsodium-1.0.12
    ./configure && make && make install
    echo "/usr/local/lib" > /etc/ld.so.conf.d/local.conf
    ldconfig
    # Install ShadowsocksR
    cd $cur_dir
    wget https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip
     unzip -q shadowsocks-manyuser.zip
     mv shadowsocks-manyuser /usr/local/shadowsocks/
    #git clone -b manyuser https://github.com/breakwa11/shadowsocks.git /usr/local/shadowsocks
    if [ -f /usr/local/shadowsocks/server.py ]; then
        chmod +x /etc/init.d/shadowsocks
        # Add run on system start up
        if [ "$OS" == 'CentOS' ]; then
            chkconfig --add shadowsocks
            chkconfig shadowsocks on
        else
            update-rc.d -f shadowsocks defaults
        fi
        # Run ShadowsocksR in the background
        /etc/init.d/shadowsocks start
        clear
        echo
        echo "恭喜你，shadowsocksr安装完成！"
        echo -e "服务器IP: \033[41;37m ${IP} \033[0m"
        echo -e "远程连接端口: \033[41;37m ${shadowsocksport} \033[0m"
        echo -e "远程连接密码: \033[41;37m ${shadowsockspwd} \033[0m"
        echo -e "本地监听IP: \033[41;37m 127.0.0.1 \033[0m"
        echo -e "本地监听端口: \033[41;37m 1080 \033[0m"
        echo -e "认证方式: \033[41;37m auth_sha1 \033[0m"
        echo -e "协议: \033[41;37m http_simple \033[0m"
        echo -e "加密方式: \033[41;37m chacha20 \033[0m"
        echo
        echo "如果你想改变认证方式和协议，请参考网址："
        echo "https://github.com/breakwa11/shadowsocks-rss/wiki/Server-Setup"
        echo
        echo "安装完成！Enjoy yourself!"
        echo
    else
        echo "ShadowsocksR安装失败！"
        install_cleanup
        exit 1
    fi
}

#改成北京时间
function check_datetime(){
	rm -rf /etc/localtime
	ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
	ntpdate 1.cn.pool.ntp.org
}

# Install cleanup
function install_cleanup(){
    cd $cur_dir
    rm -f manyuser.zip
    rm -rf shadowsocks-manyuser
    rm -f libsodium-1.0.12.tar.gz
    rm -rf libsodium-1.0.12
}


# Uninstall ShadowsocksR
function uninstall_shadowsocks(){
    printf "你确定卸载shadowsocksr？ (y/n) "
    printf "\n"
    read -p "(Default: n):" answer
    if [ -z $answer ]; then
        answer="n"
    fi
    if [ "$answer" = "y" ]; then
        /etc/init.d/shadowsocks status > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            /etc/init.d/shadowsocks stop
        fi
        checkos
        if [ "$OS" == 'CentOS' ]; then
            chkconfig --del shadowsocks
        else
            update-rc.d -f shadowsocks remove
        fi
        rm -f /etc/shadowsocks.json
        rm -f /etc/init.d/shadowsocks
        rm -rf /usr/local/shadowsocks
        echo "ShadowsocksR uninstall success!"
    else
        echo "uninstall cancelled, Nothing to do"
    fi
}


# Install ShadowsocksR
function install_shadowsocks(){
    checkos
    rootness
    disable_selinux
    pre_install
    download_files
    config_shadowsocks
    install_ss
    if [ "$OS" == 'CentOS' ]; then
        firewall_set > /dev/null 2>&1
    fi
	check_datetime
    install_cleanup
	
}

# Initialization step
action=$1
[ -z $1 ] && action=install
case "$action" in
install)
    install_shadowsocks
    ;;
uninstall)
    uninstall_shadowsocks
    ;;
*)
    echo "Arguments error! [${action} ]"
    echo "Usage: `basename $0` {install|uninstall}"
    ;;
esac
