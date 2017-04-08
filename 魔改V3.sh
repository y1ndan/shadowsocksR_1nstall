#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

                   # 检测系统

function checkos(){
     if [ -f /etc/redhat-release ];
     then
          echo
          echo "                       当前系统为CentOS"
          OS='CentOS'
     elif [ ! -z "`cat /etc/issue | grep bian`" ];         
     then
          echo
          echo "                       当前系统为Debian"
          OS='Debian'
    elif [ ! -z "`cat /etc/issue | grep Ubuntu`" ];
    then
          echo
          echo "                       当前系统为Ubuntu"
          OS='Ubuntu'
    else
          echo
          echo "        当前系统不支持，请安装合适的系统！"
        exit 1
    fi
}

                   # 检测网站是否存在

function check_domain(){
      if test -d /home/wwwroot/${domain} && test -f /usr/local/nginx/conf/vhost/${domain}.conf
     then
         echo
         echo    正确: 站点已存在，脚本继续运行
         echo
     else
         echo
         echo    错误: 站点不存在，请创建站点后再运行脚本！
         echo
         exit 1
     fi
}

                   # 填写网站信息

function web_information(){

    echo
    echo                        请仔细填写信息
    echo
    echo "输入 SSR 魔改版 前端 网站地址:"
    read -p "(默认: tuzi-ss.ml):" domain
    [ -z "$domain" ] && domain="tuzi-ss.ml"

    check_domain

    echo "输入 SSR 魔改版 前端 网站名称:"
    read -p "(默认: Tuzi--SS):" webname
    [ -z "$webname" ] && webname="Tuzi--SS"
    echo
    # 设置SMTP发信邮箱 
    echo "输入SMTP发信邮箱Host:"
    read -p "(默认: smtp.qq.com):" emailhost
    [ -z "$emailhost" ] && emailhost="smtp.qq.com"
    echo
    echo "输入SMTP发信邮箱:"
    read -p "(默认: 1016599602@qq.com):" email
    [ -z "$email" ] && email="1016599602@qq.com"
    echo
    echo "输入SMTP发信邮箱密码:"
    read -p "(默认: ):" emailpasswd
    [ -z "$emailpasswd" ] && emailpasswd=""
    echo
    echo "---------------------------"
    echo "网站地址 = $domain  网站名称 = $webname"
    echo "---------------------------"
    echo
    echo "---------------------------"
    echo "SMTP发信邮箱Host = $emailhost  SMTP发信邮箱 = $email  SMTP发信邮箱密码 = $emailpasswd"
    echo "---------------------------"

    sleep 1

}


                   # 设置数据库

function set_database(){

    if [ "${type}" != "1" ];
    then
    echo "输入数据库root密码:"
    read -p "(默认: tuzi):" rootpasswd
    [ -z "$rootpasswd" ] && rootpasswd="tuzi"
    echo
    fi
    echo -e "输入数据库地址:"
    read -p "(默认: localhost):" dbhost
    [ -z "$dbhost" ] && dbhost="localhost"
    echo
    echo -e "输入数据库名:"
    read -p "(默认: SSR):" dbname
    [ -z "$dbname" ] && dbname="SSR"
    echo
    echo -e "输入数据库用户:"
    read -p "(默认: SSR):" dbuser
    [ -z "$dbuser" ] && dbuser="SSR"
    echo
    echo -e "输入数据库密码:"
    read -p "(默认: SSR):" dbpasswd
    [ -z "$dbpasswd" ] && dbpasswd="SSR"
    echo
    echo "---------------------------"
    echo "数据库root密码 = $rootpasswd"
    echo "---------------------------"
    echo
    echo "---------------------------"
    echo "数据库地址 = $dbhost"
    echo "---------------------------"
    echo
    echo "---------------------------"
    echo "数据库名 = $dbname   数据库用户 = $dbuser  数据库密码 = $dbpasswd"

    echo "---------------------------"
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
    echo "输入任意字符开始！"
    echo "结束请按crtl+c"
    char=`get_char`


    sleep 3

}


                   # 关闭 selinux

function disable_selinux(){

    sleep 1

    if [ -s /etc/selinux/config ] && grep 'SELINUX=enforcing' /etc/selinux/config; 
    then
        sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
        setenforce 0
        echo    已关闭 selinux

    fi
    echo "                                      3秒后开始安装！"

    sleep 3



}
                   # 关闭防火墙

function stop_iptables(){

    echo
    echo    关闭防火墙
    echo

    sleep 1

    if [ "$OS" == 'CentOS' ]; 
    then
        service iptables stop

        chkconfig iptables off

    else
        iptables -F

    fi

    sleep 3

}



                   # 时间同步

function check_datetime(){

    echo
    echo    同步北京时间
    echo

    sleep 1

    if [ "$OS" == 'CentOS' ]; 
    then
        rm -rf /etc/localtime
        ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
        ntpdate 1.cn.pool.ntp.org

    fi

    sleep 3
}
                    # 创建数据库

function create_database(){
    echo
    echo   创建数据库
    echo
    sleep 1

mysql -uroot -p${rootpasswd} << EOF 2>/dev/null
create database ${dbname};
CREATE USER '${dbuser}'@'%' IDENTIFIED BY '${dbpasswd}';
GRANT ALL PRIVILEGES ON ${dbname}.* TO '${dbuser}'@'%' IDENTIFIED BY '${dbpasswd}';
EOF
[ $? -eq 0 ] && echo "创建数据库成功!" || echo 要创建的数据库已存在！

    echo
    echo   导入数据库
    echo

    sleep 1

      wget http://yun.xiamo.ml/SS-Panel/glzjin_all.sql -O /home/wwwroot/${domain}/glzjin_all.sql

     sleep 1

      mysql -u${dbuser} -p${dbpasswd} ${dbname} < /home/wwwroot/${domain}/glzjin_all.sql

    sleep 5
}



                   # 安装环境依赖

function dependence(){

    echo
    echo    安装环境依赖
    echo
    sleep 1

    if [ "$OS" == 'CentOS' ]; 
    then
           yum update -y  &&  yum install -y wget unzip openssl-devel gcc swig python python-devel python-setuptools autoconf libtool libevent git ntpdate vixie-cron && easy_install pip

        yum install -y   m2crypto automake make curl curl-devel zlib-devel perl perl-devel cpio expat-devel gettext-devel

        pip install cymysql

        

   else
        apt-get update 
        apt-get -y install  git-core python python-dev python-pip python-m2crypto curl build-essential supervisor

        pip install cymysql

    fi
        sleep 3

}

                   # 开启 crontab

function start_crontab(){


    sleep 1

    if [ "$OS" == 'CentOS' ]; 
    then
    echo
    echo    开启crontab
    echo
           service crond restart

          chkconfig --level 35 crond on

    fi

    sleep 3

}



                   # 配置supervisor

function set_supervisor(){

    echo
    echo    配置supervisor守护
    echo

    sleep 1

    if [ "$OS" == 'CentOS' ]; 
    then
        rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm --quiet

        yum install supervisor python-pip -y

        pip install supervisor==3.1

        chkconfig supervisord on

        wget https://github.com/glzjin/ssshell-jar/raw/master/supervisord.conf -O /etc/supervisord.conf

        wget https://github.com/glzjin/ssshell-jar/raw/master/supervisord -O /etc/init.d/supervisord


        cat > /home/shadowsocks.conf<<-EOF
[program:shadowsocks]

command=python /${domain}_SSR/shadowsocks/server.py

directory=/${domain}_SSR/shadowsocks

autorestart=true

startsecs=10

startretries=36

redirect_stderr=true

user=root ; setuid to this UNIX account to run the program

log_stdout=true ; if true, log program stdout (default true)

log_stderr=true ; if true, log program stderr (def false)

logfile=/var/log/shadowsocks.log ; child log path, use NONE for none; default AUTO

;logfile_maxbytes=1MB ; max # logfile bytes b4 rotation (default 50MB)

;logfile_backups=10 ; # of logfile backups (default 10)

EOF

        cat /home/shadowsocks.conf >> /etc/supervisord.conf

        sed -i "23i ulimit -n 65535" /etc/init.d/supervisord

    else
        cat > /etc/supervisor/conf.d/shadowsocks.conf<<-EOF
[program:shadowsocks]
command=python /${domain}_SSR/shadowsocks/server.py
directory=/${domain}_SSR/shadowsocks
user=root
autostart = true
autoresart = true
stderr_logfile = /var/log/shadowsocks.log
stdout_logfile = /var/log/shadowsocks.log
startsecs=3
EOF

    fi

    sleep 3

}

                # 安装libsodium


function install_libsodium(){

    echo
    echo    安装libsodium
    echo

    sleep 1

        cd

        wget -N https://github.com/jedisct1/libsodium/releases/download/1.0.10/libsodium-1.0.10.tar.gz

        tar xf libsodium-1.0.10.tar.gz && cd libsodium-1.0.10

        ./configure && make && make install

        ldconfig

        sleep 3

}


                            #安装 SSR 魔改版 后端

function install_SSR(){

    echo
    echo    下载 SSR 魔改版 后端 文件
    echo

    sleep 1

        mkdir /${domain}_SSR && cd /${domain}_SSR && git clone -b manyuser https://github.com/glzjin/shadowsocks.git

    echo
    echo    下载完成，正在配置 SSR 魔改版 后端
    echo

    sleep 1

        cd shadowsocks && cp apiconfig.py userapiconfig.py && cp config.json user-config.json

    sleep 1

    if [ "${type}" = "1" ];
    then
        cat > /${domain}_SSR/shadowsocks/userapiconfig.py <<-EOF
# Config
NODE_ID = ${Node_id}

#hour,set 0 to disable
SPEEDTEST = 6
CLOUDSAFE = 1
ANTISSATTACK = 0
AUTOEXEC = 0
MULTI_THREAD = 0

SERVER_PUB_ADDR = '127.0.0.1' # mujson_mgr need this to generate ssr link
API_INTERFACE = 'glzjinmod' #mudbjson, sspanelv2, sspanelv3, sspanelv3ssr, muapiv2(not support)

#mudb
MUDB_FILE = 'mudb.json'

# Mysql
MYSQL_HOST = '${dbhost}'
MYSQL_PORT = 3306
MYSQL_USER = '${dbuser}'
MYSQL_PASS = '${dbpasswd}'
MYSQL_DB = '${dbname}'
MYSQL_UPDATE_TIME = 60

MYSQL_SSL_ENABLE = 0
MYSQL_SSL_CA = ''
MYSQL_SSL_CERT = ''
MYSQL_SSL_KEY = ''

# API
API_HOST = '127.0.0.1'
API_PORT = 80
API_PATH = '/mu/v2/'
API_TOKEN = 'abcdef'
API_UPDATE_TIME = 60

# Manager (ignore this)
MANAGE_PASS = 'ss233333333'
#if you want manage in other server you should set this value to global ip
MANAGE_BIND_IP = '127.0.0.1'
#make sure this port is idle
MANAGE_PORT = 23333

EOF

    else 
        cat > /${domain}_SSR/shadowsocks/userapiconfig.py <<-EOF
# Config
NODE_ID = 7

#hour,set 0 to disable
SPEEDTEST = 6
CLOUDSAFE = 1
ANTISSATTACK = 0
AUTOEXEC = 0
MULTI_THREAD = 0

SERVER_PUB_ADDR = '127.0.0.1' # mujson_mgr need this to generate ssr link
API_INTERFACE = 'glzjinmod' #mudbjson, sspanelv2, sspanelv3, sspanelv3ssr, muapiv2(not support)

#mudb
MUDB_FILE = 'mudb.json'

# Mysql
MYSQL_HOST = '${dbhost}'
MYSQL_PORT = 3306
MYSQL_USER = '${dbuser}'
MYSQL_PASS = '${dbpasswd}'
MYSQL_DB = '${dbname}'
MYSQL_UPDATE_TIME = 60

MYSQL_SSL_ENABLE = 0
MYSQL_SSL_CA = ''
MYSQL_SSL_CERT = ''
MYSQL_SSL_KEY = ''

# API
API_HOST = '127.0.0.1'
API_PORT = 80
API_PATH = '/mu/v2/'
API_TOKEN = 'abcdef'
API_UPDATE_TIME = 60

# Manager (ignore this)
MANAGE_PASS = 'ss233333333'
#if you want manage in other server you should set this value to global ip
MANAGE_BIND_IP = '127.0.0.1'
#make sure this port is idle
MANAGE_PORT = 23333

EOF

fi

        sleep 3

}


               # 开启supervisor

function start_supervisor(){

    echo
    echo    开启supervisor守护
    echo

    sleep 1

    if [ "$OS" == 'CentOS' ]; 
    then
        /etc/init.d/supervisord restart

    else
        /etc/init.d/supervisor restart 
             
    fi

    sleep 3
    echo
    echo    SSR 魔改版 后端 配置完成！
    echo
}


               # 安装 SSR 魔改版前端

function install_ss-panel-v3-mod(){

    echo
    echo    配置 SSR 魔改版 前端
    echo

# 下载前端文件

    echo
    echo    下载SSR 魔改版 前端 文件
    echo

    sleep 1

    cd /home/wwwroot/$domain

    git clone https://github.com/glzjin/ss-panel-v3-mod.git tmp 

    mv tmp/.git .  

    rm -rf tmp 

    git reset --hard

# 配置网站

    echo
    echo   下载完成，正在部署
    echo

    sleep 3

    cd /home/wwwroot/$domain

    sleep 1

    chown -R root:root *

    chmod -R 755 *

    chown -R www:www storage

    sleep 1

    chattr -i .user.ini

    mv .user.ini public

    cd public

    chattr +i .user.ini

    sleep 1
 
    cd /home/wwwroot/${domain}

    sleep 1

    cat > /home/wwwroot/${domain}/config/.config.php<<-EOF
<?php

//  ss-panel v3 配置
//
// !!! 修改此key为随机字符串确保网站安全 !!!
\$System_Config['key'] = 'asdfghjkltuzi';
\$System_Config['debug'] =  'false';  //  正式环境请确保为false
\$System_Config['appName'] = '${webname}';             //站点名称
\$System_Config['baseUrl'] = 'http://${domain}';            // 站点地址
\$System_Config['timeZone'] = 'PRC';        // RPC 天朝时间  UTC 格林时间
\$System_Config['pwdMethod'] = 'sha256';       // 密码加密   可选 md5,sha256
\$System_Config['salt'] = '';               // 密码加密用，从旧版升级请留空
\$System_Config['theme']    = 'material';   // 主题
\$System_Config['authDriver'] = 'cookie';   // 登录验证存储方式,推荐使用Redis   可选: cookie,redis
\$System_Config['sessionDriver'] = 'cookie';
\$System_Config['cacheDriver'] = 'cookie';
\$System_Config['tokenDriver'] = 'db';

//$System_Config['version'] = '<a href="https://www.zhaoj.in">Glzjin</a> mod-2016042210000';

// mu key 用于校验ss-go mu的请求,半角逗号分隔
\$System_Config['muKey'] = '';
// 邮件
\$System_Config['mailDriver'] = 'smtp';   // mailgun or smtp

// 用户签到设置
\$System_Config['checkinTime'] = '24';      // 签到间隔时间 单位小时
\$System_Config['checkinMin'] = '100';       // 签到最少流量 单位MB
\$System_Config['checkinMax'] = '200';       // 签到最多流量

//
\$System_Config['defaultTraffic'] = '1';      // 用户初始流量 单位GB

// 注册后获得的邀请码数量
\$System_Config['inviteNum'] = '0';

# database 数据库配置
\$System_Config['db_driver'] = 'mysql';
\$System_Config['db_host'] = '${dbhost}';
\$System_Config['db_database'] = '${dbname}';
\$System_Config['db_username'] = '${dbuser}';
\$System_Config['db_password'] = '${dbpasswd}';
\$System_Config['db_charset'] = 'utf8';
\$System_Config['db_collation'] = 'utf8_general_ci';
\$System_Config['db_prefix'] = '';

# redis
\$System_Config['redis_scheme'] = 'tcp';
\$System_Config['redis_host'] = '127.0.0.1';
\$System_Config['redis_port'] = '6379';
\$System_Config['redis_database'] = '0';
\$System_Config['redis_password']="";

# mailgun
\$System_Config['mailgun_key'] = '';
\$System_Config['mailgun_domain'] = '';
\$System_Config['mailgun_sender'] = '';

# smtp
\$System_Config['smtp_host'] = '${emailhost}';
\$System_Config['smtp_username'] = '${email}';
\$System_Config['smtp_port'] = '25';
\$System_Config['smtp_name'] = '${email}';
\$System_Config['smtp_sender'] = '${email}';
\$System_Config['smtp_passsword'] = '${emailpasswd}';
\$System_Config['smtp_ssl'] = 'false';

# aws
\$System_Config['aws_access_key_id'] = '';
\$System_Config['aws_secret_access_key'] = '';


#glzjin's time

#功能开关
\$System_Config['enable_wecenter']='false';
\$System_Config['enable_radius']='false';
\$System_Config['enable_cloudxns']='false';
\$System_Config['enable_duoshuo']='false';
\$System_Config['enable_rss']='true';
\$System_Config['enable_paymentwall']='false';




#用户过期时间，在注册时设置。（天）
\$System_Config['user_expire_in_default']='365';

#Radius数据库设置
\$System_Config['radius_db_host']='';
\$System_Config['radius_db_database']='';
\$System_Config['radius_db_user']='';
\$System_Config['radius_db_password']='';

#Radius连接密钥
\$System_Config['radius_secret']='';




#多说设置
\$System_Config['duoshuo_shortname']="";
\$System_Config['duoshuo_apptoken']="";


#节点离线设置
\$System_Config['node_offline_warn']='true';

#异地登陆提示
\$System_Config['login_warn']='false';

#端口池
\$System_Config['min_port']='10000';
\$System_Config['max_port']='60000';

#两种方式相对于ss端口的偏移
\$System_Config['pacp_offset']='-20000';
\$System_Config['pacpp_offset']='-20000';

#测速周期/h
\$System_Config['Speedtest_duration']='6';


#随机分组，注册时随机分配到的分组，多个分组请用英文半角逗号分隔。
\$System_Config['ramdom_group']='0';

#Wecenter 数据库信息
\$System_Config['wecenter_db_host']='localhost';
\$System_Config['wecenter_db_database']='';
\$System_Config['wecenter_db_user']='';
\$System_Config['wecenter_db_password']='';

#系统根域名 zhaoj.in 这样
\$System_Config['wecenter_system_main_domain']='';

#访问路径，不开启这个功能的话就清空这个设置项吧
\$System_Config['wecenter_url']='http://help.';

#可从安装好的 wecenter 目录下的 system/config.inc.php 得到

#G_COOKIE_PREFIX
\$System_Config['wecenter_cookie_prefix']='mmg_';

#G_COOKIE_HASH_KEY
\$System_Config['wecenter_cookie_key']='';

#充值返利百分比
\$System_Config['code_payback']='20';

#注册时的流量重置日以及需要重置的流量,0不重置
\$System_Config['reg_auto_reset_day']='1';
\$System_Config['reg_auto_reset_bandwidth']='1';



#PaymentWall
\$System_Config['pmw_publickey']='';
\$System_Config['pmw_privatekey']='';
\$System_Config['pmw_widget']='m2_1';
\$System_Config['pmw_height']='350px';


#Cloudxns
\$System_Config['cloudxns_apikey']='';#自己去 cloudxns.net 申请
\$System_Config['cloudxns_apisecret']='';
\$System_Config['cloudxns_domain']='zhaoj.in';#你的域名



#自动备份设置
\$System_Config['enable_auto_backup']='true';
\$System_Config['auto_backup_email']='${email}';
\$System_Config['auto_backup_webroot']='/home/wwwroot/${domain}/';
\$System_Config['auto_backup_passwd']='';

#跳转延时,ms
\$System_Config['jump_delay']='1800';



#是否启用邀请码注册
\$System_Config['enable_invite_code']='falae';

#是否启用邮箱验证码
\$System_Config['enable_email_verify']='true';

#邮箱验证码有效期
\$System_Config['email_verify_ttl']='3600';

#单IP可请求验证码次数（上面那个周期内）
\$System_Config['email_verify_iplimit']='10';


#注册时默认加密方式
\$System_Config['reg_method']='chacha20';

#注册时默认协议
\$System_Config['reg_protocol']='auth_sha1';

#注册时默认协议参数
\$System_Config['reg_protocol_param']='';

#注册时默认混淆方式
\$System_Config['reg_obfs']='http_simple';

#注册时默认混淆参数
\$System_Config['reg_obfs_param']='';

#注册时默认禁止访问IP列表，半角英文逗号分割
\$System_Config['reg_forbidden_ip']='';

#注册时默认禁止访问端口列表，半角英文逗号分割，支持端口段
\$System_Config['reg_forbidden_port']='';

#是否将登陆线程和IP绑定
\$System_Config['enable_login_bind_ip']='true';



#等级到期时是否重置流量
\$System_Config['enable_class_expire_reset']='true';

#等级到期时重置为的流量值，GB
\$System_Config['enable_class_expire_reset_traffic']='1';

#账户到期时是否重置流量
\$System_Config['enable_account_expire_reset']='true';

#账户到期时重置为的流量值，GB
\$System_Config['enable_account_expire_reset_traffic']='0';

#购买时是否重置流量
\$System_Config['enable_bought_reset']='true';

#账户到期之后是否会删除账户
\$System_Config['enable_account_expire_delete']='true';

#账户到期几天之后会删除账户
\$System_Config['enable_account_expire_delete_days']='0';

#验证码相关设置，自己去 Geetest.com 申请
\$System_Config['geetest_id']='';
\$System_Config['geetest_key']='';

#启用注册验证码
\$System_Config['enable_geetest_reg']='false';

#启用登录验证码
\$System_Config['enable_geetest_login']='false';

#启用签到验证码
\$System_Config['enable_geetest_checkin']='false';

#自动清理多少天没签到的0级用户
\$System_Config['enable_auto_clean_uncheck']='false';
\$System_Config['enable_auto_clean_uncheck_days']='7';


#自动清理多少天没使用的0级用户
\$System_Config['enable_auto_clean_unused']='false';
\$System_Config['enable_auto_clean_unused_days']='30';


#是否夹带统计代码，自己在 resources/views/{主题名} 下创建一个 analytics.tpl ，如果有必要就用 literal 界定符
\$System_Config['enable_analytics_code']='false';
\$System_Config['enable_alipay']='true';

#是否启用捐赠相关功能
\$System_Config['enable_donate']='false';

#telegram bot,是否启用
\$System_Config['enable_telegram']='false';

#telegram bot,bot 的 token ，跟 father bot 申请
\$System_Config['telegram_token']='';

#telegram bot,群组会话 ID,把机器人拉进群里之后跟他 /ping 一下即可得到。
\$System_Config['telegram_chatid']='';

#多用户混淆参数后缀
\$System_Config['mu_suffix']='';

EOF

    sleep 3

# 优化网站公告

    echo
    echo    优化网站公告
    echo

    sleep 1

    cat > /home/wwwroot/${domain}/resources/views/material/user/index.tpl<<-EOF

{include file='user/main.tpl'}

	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">用户中心</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">
						
						<div class="col-lg-6 col-md-6">
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">系统中最新公告</p>
										<p>其他公告请到<a href="/user/announcement"/>公告面板</a>查看。</p>
										{if \$ann != null}
										<p>{\$ann->content}</p>
										{/if}
									</div>
									
								</div>
							</div>
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">配置导入</p>
										<p>这里为您提供了自动化地配置文件生成，包含了所有 Shadowsocks 服务器的信息，方便您在诸多的服务器中快速添加，快速切换。</p>
										<p>&nbsp;Windows<a href="/downloads/client/ShadowsocksR-win.7z"><i class="icon icon-lg">desktop_windows</i>&nbsp;下载客户端文件&nbsp;</a>，解压，然后<a href="/user/getpcconf">&nbsp;下载配置文件&nbsp;</a>，放到程序目录下，运行程序，选择一个合适的服务器，然后开启系统代理即可上网。</p>
										<!--<p>&nbsp;Mac OS X<a href="/downloads/client/ShadowsocksX.dmg"><i class="icon icon-lg">laptop_mac</i>&nbsp;下载客户端</a>，安装，然后<a href="/user/getpcconf">&nbsp;下载配置文件&nbsp;</a>，放到程序目录下，运行程序，选择一个合适的服务器，然后开启系统代理即可上网。</p>-->
										<p>&nbsp;iOS<i class="icon icon-lg">laptop_mac</i><a href="/link/{\$ios_token}">&nbsp;下载配置文件&nbsp;</a>，导入到 Surge 中，然后就可以随意切换服务器上网了。</p>
										<p>&nbsp;Android<a href="https://github.com/glzjin/shadowsocks-android/releases"><i class="icon icon-lg">android</i>&nbsp;下载SSR客户端&nbsp;</a>，安装，然后点击<a id="android_add" href="{\$android_add}">&nbsp;配置文件&nbsp;</a>导入客户端，然后选择一个合适的服务器即可上网。</p>
                            <p class="card-heading">免流攻略</p>
		                      <p>移动用户:  点击<a id="android_add" href="{\$android_add}">&nbsp;配置文件&nbsp;</a>导入客户端，选择137端口或者138端口，连接上网即可</p>
                            <p>联通用户: 点击<a id="android_add" href="{\$android_add}">&nbsp;配置文件&nbsp;</a>导入客户端，选择非多用户单端口，在混淆参数处，填写免流Host， 连接上网即可</p>
                            <p>电信用户: 点击<a id="android_add" href="{\$android_add}">&nbsp;配置文件&nbsp;</a>导入客户端，选择非多用户单端口，在混淆参数处，填写免流Host， 连接上网即可</p>
									</div>
									
								</div>
							</div>
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">帐号使用情况</p>
										<dl class="dl-horizontal">
											<dt>帐号等级</dt>
											<dd>{\$user->class}</dd>

											<dt>等级过期时间</dt>
											<dd>{\$user->class_expire}</dd>

											<dt>帐号过期时间</dt>
											<dd>{\$user->expire_in}</dd>
											
											<dt>速度限制</dt>
											{if \$user->node_speedlimit!=0}
											<dd>{\$user->node_speedlimit}Mbps</dd>
											{else}
											<dd>不限速</dd>
											{/if}
										</dl>
									</div>
									
								</div>
							</div>
						
							
							
							
						</div>
						
						<div class="col-lg-6 col-md-6">
							
						
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
									
										<div id="traffic_chart" style="height: 300px; width: 100%;"></div>
										
										<script src="//cdn.bootcss.com/canvasjs/1.7.0/canvasjs.js"></script>
										<script type="text/javascript">
											var chart = new CanvasJS.Chart("traffic_chart",
											{
												title:{
													text: "流量使用情况",
													fontFamily: "Impact",
													fontWeight: "normal"
												},

												legend:{
													verticalAlign: "bottom",
													horizontalAlign: "center"
												},
												data: [
												{
													//startAngle: 45,
													indexLabelFontSize: 20,
													indexLabelFontFamily: "Garamond",
													indexLabelFontColor: "darkgrey",
													indexLabelLineColor: "darkgrey",
													indexLabelPlacement: "outside",
													type: "doughnut",
													showInLegend: true,
													dataPoints: [
														{if \$user->transfer_enable != 0}
														{
															y: {\$user->last_day_t/\$user->transfer_enable*100}, legendText:"已用 {number_format(\$user->last_day_t/\$user->transfer_enable*100,2)}% {\$user->LastusedTraffic()}", indexLabel: "已用 {number_format(\$user->last_day_t/\$user->transfer_enable*100,2)}% {\$user->LastusedTraffic()}"
														},
														{
															y: {(\$user->u+\$user->d-\$user->last_day_t)/\$user->transfer_enable*100}, legendText:"今日 {number_format((\$user->u+\$user->d-\$user->last_day_t)/\$user->transfer_enable*100,2)}% {\$user->TodayusedTraffic()}", indexLabel: "今日 {number_format((\$user->u+\$user->d-\$user->last_day_t)/\$user->transfer_enable*100,2)}% {\$user->TodayusedTraffic()}"
														},
														{
															y: {(\$user->transfer_enable-(\$user->u+\$user->d))/\$user->transfer_enable*100}, legendText:"剩余 {number_format((\$user->transfer_enable-(\$user->u+\$user->d))/\$user->transfer_enable*100,2)}% {\$user->unusedTraffic()}", indexLabel: "剩余 {number_format((\$user->transfer_enable-(\$user->u+\$user->d))/\$user->transfer_enable*100,2)}% {\$user->unusedTraffic()}"
														}
														{/if}
													]
												}
												]
											});

											chart.render();
										</script>
										
									</div>
									
								</div>
							</div>
						
						
					
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">签到获取流量</p>
											<p>每天可以通过签到获取流量。</p>

											<p>每次签到可以获取{\$config['checkinMin']}~{\$config['checkinMax']}MB流量。</p>
										
											<p>每天可以签到一次。您可以点击按钮或者摇动手机来签到。</p>

											<p>上次签到时间：<code>{\$user->lastCheckInTime()}</code></p>
											
											<p id="checkin-msg"></p>
											
											{if \$geetest_html != null}
												<div id="popup-captcha"></div>
											{/if}
									</div>
									
									<div class="card-action">
										<div class="card-action-btn pull-left">
											{if \$user->isAbleToCheckin() }
												<p id="checkin-btn">
													<button id="checkin" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;签到</button>
												</p>
											{else}
												<p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">check</span>&nbsp;今天已签到</a></p>
											{/if}
										</div>
									</div>
									
								</div>
							</div>
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">连接信息</p>
											<dl class="dl-horizontal">
												<dt>端口</dt>
												<dd>{\$user->port}</dd>
												<dt>密码</dt>
												<dd>{\$user->passwd}</dd>
												<!--
												<dt>加密方式</dt>
												<dd>{\$user->method}</dd>
												-->
												<dt>上次使用</dt>
												<dd>{\$user->lastSsTime()}</dd>
											</dl>
									</div>
									
								</div>
							</div>
						
						
						
						
						{if \$enable_duoshuo=='true'}
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">讨论区</p>
											<div class="ds-thread" data-thread-key="0" data-title="index" data-url="{\$baseUrl}/user/"></div>
											<script type="text/javascript">
											var duoshuoQuery = {

											short_name:"{\$duoshuo_shortname}"


											};
												(function() {
													var ds = document.createElement('script');
													ds.type = 'text/javascript';ds.async = true;
													ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
													ds.charset = 'UTF-8';
													(document.getElementsByTagName('head')[0] 
													 || document.getElementsByTagName('body')[0]).appendChild(ds);
												})();
											</script>
									</div>
									
								</div>
							</div>
						
						{/if}
						
						{include file='dialog.tpl'}
						
					</div>
						
					
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}

<script src="theme/material/js/shake.js/shake.js"></script>



{if \$geetest_html == null}
<script>
window.onload = function() { 
    var myShakeEvent = new Shake({ 
        threshold: 15 
    }); 
 
    myShakeEvent.start(); 
 
    window.addEventListener('shake', shakeEventDidOccur, false); 
 
    function shakeEventDidOccur () { 
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}
		
        \$.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    \$("#checkin-msg").html(data.msg);
                    \$("#checkin-btn").hide();
					\$("#result").modal();
                    \$("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					\$("#result").modal();
                    \$("#msg").html("发生错误：" + jqXHR.status);
                }
            });
    } 
}; 

</script>



<script>
    \$(document).ready(function () {
        \$("#checkin").click(function () {
            \$.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    \$("#checkin-msg").html(data.msg);
                    \$("#checkin-btn").hide();
					\$("#result").modal();
                    \$("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					\$("#result").modal();
                    \$("#msg").html("发生错误：" + jqXHR.status);
                }
            })
        })
    })
	
</script>
{else}


<script>
window.onload = function() { 
    var myShakeEvent = new Shake({ 
        threshold: 15 
    }); 
 
    myShakeEvent.start(); 
 
    window.addEventListener('shake', shakeEventDidOccur, false); 
 
    function shakeEventDidOccur () { 
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}
		
        c.show();
    } 
}; 

</script>



<script>


	var handlerPopup = function (captchaObj) {
		c = captchaObj;
		captchaObj.onSuccess(function () {
			var validate = captchaObj.getValidate();
            \$.ajax({
                url: "/user/checkin", // 进行二次验证
                type: "post",
                dataType: "json",
                data: {
                    // 二次验证所需的三个值
                    geetest_challenge: validate.geetest_challenge,
                    geetest_validate: validate.geetest_validate,
                    geetest_seccode: validate.geetest_seccode
                },
                success: function (data) {
                    \$("#checkin-msg").html(data.msg);
                    \$("#checkin-btn").hide();
					\$("#result").modal();
                    \$("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					\$("#result").modal();
                    \$("#msg").html("发生错误：" + jqXHR.status);
                }
            });
        });
        // 弹出式需要绑定触发验证码弹出按钮
        captchaObj.bindOn("#checkin");
        // 将验证码加到id为captcha的元素里
        captchaObj.appendTo("#popup-captcha");
        // 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
    };

	initGeetest({
		gt: "{\$geetest_html->gt}",
		challenge: "{\$geetest_html->challenge}",
		product: "popup", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
		offline: {if \$geetest_html->success}0{else}1{/if} // 表示用户后台检测极验服务器是否宕机，与SDK配合，用户一般不需要关注
	}, handlerPopup);
	
	
</script>


{/if}





EOF

    sleep 3

    echo
    echo    配置网站伪静态规则
    echo

    sleep 1

# 配置网站伪静态
    cat > /usr/local/nginx/conf/vhost/${domain}.conf<<-EOF
server
    {
        listen 80;
        #listen [::]:80;
        server_name ${domain};
        index index.html index.htm index.php default.html default.htm default.php;
        root  /home/wwwroot/${domain}/public;

        location / {
                        try_files \$uri \$uri/ /index.php\$is_args$args;
                }
        #error_page   404   /404.html;
        include enable-php.conf;

        location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)\$
        {
            expires      30d;
        }

        location ~ .*\.(js|css)?\$
        {
            expires      12h;
        }

        location ~ /\.
        {
            deny all;
        }

        access_log off;
}
EOF

      sleep 3

}

               # 配置 crontab 计划任务

function set_crontab(){

    echo
    echo    配置 crontab 计划任务
    echo

    sleep 1

    if [ "$OS" == 'CentOS' ]; 
    then
        cat > /home/crontab.txt<<-EOF
0 18 * * * php /home/wwwroot/${domain}/xcat sendDiaryMail
*/1 * * * * php /home/wwwroot/${domain}/xcat synclogin
*/1 * * * * php /home/wwwroot/${domain}/xcat syncvpn
0 0 * * * php -n /home/wwwroot/${domain}/xcat dailyjob
*/1 * * * * php /home/wwwroot/${domain}/xcat checkjob
*/1 * * * * php -n /home/wwwroot/${domain}/xcat syncnas
0 0 * * * /etc/init.d/supervisord restart

EOF

    else
        cat > /home/crontab.txt<<-EOF
0 18 * * * php /home/wwwroot/${domain}/xcat sendDiaryMail
*/1 * * * * php /home/wwwroot/${domain}/xcat synclogin
*/1 * * * * php /home/wwwroot/${domain}/xcat syncvpn
0 0 * * * php -n /home/wwwroot/${domain}/xcat dailyjob
*/1 * * * * php /home/wwwroot/${domain}/xcat checkjob
*/1 * * * * php -n /home/wwwroot/${domain}/xcat syncnas
0 0 * * * /etc/init.d/supervisor restart

EOF

    fi

      sleep 2

      crontab /home/crontab.txt

      sleep 3
}


function del_file(){
 
    echo
    echo   删除遗留文件
    echo
    sleep 1


    rm -f /home/crontab.txt

    rm -f /home/shadowsocks.conf

    rm -f /root/ssr.sh
}


               # 创建网站管理员



function create_webadmin(){

    echo
    echo   重载nginx
    echo
    sleep 1

    lnmp nginx reload

    sleep 2

    echo
    echo    创建网站管理员
    echo

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
    echo "输入任意字符开始创建网站管理员，完成搭建！"
    echo "结束请按crtl+c"
    char=`get_char`
}

function choose(){

    echo
    echo                        选择需要搭建的部分
    echo
    echo " 1: 安装 SSR 魔改版 前端"
    echo " 2: 安装 SSR 魔改版 后端"
    echo " 3: 安装 SSR 魔改版 前端 + SSR 魔改版 后端"
    echo
    echo
    echo
    echo
    echo
    read -p "(输入选择项: 默认 3):" type
    [ -z "$type" ] && type="3"

    if [ "${type}" = "1" ];
    then

     # 安装 SSR 魔改版前端

         web_information
         set_database 
         create_database        
         dependence
         disable_selinux
         stop_iptables
         start_crontab
         install_ss-panel-v3-mod
         set_crontab
         del_file
         check_datetime
         create_webadmin
         php xcat createAdmin



    elif [ "${type}" = "2" ];
    then

    echo " 输入网站节点 Node_id"
    read -p "(默认: 8):" Node_id
    [ -z "$Node_id" ] && Node_id="8"

 

  #安装 SSR 魔改版后端


         set_database 
         dependence
         disable_selinux
         stop_iptables
         start_crontab
         check_datetime
         set_supervisor
         del_file
         install_libsodium
         install_SSR
         start_supervisor
       
    
    elif [ "${type}" = "3" ];
    then
        
     # 安装 SSR 魔改版前端 + SSR 魔改版后端               

         web_information
         set_database 
         create_database        
         dependence
         disable_selinux
         stop_iptables
         start_crontab
         set_supervisor
         install_libsodium
         install_SSR
         start_supervisor
         install_ss-panel-v3-mod
         set_crontab
         del_file
         check_datetime
         create_webadmin
         php xcat createAdmin

    else
        echo
        echo "        选择错误，退出脚本！"
        echo
        exit 1

    fi
}

checkos
choose
