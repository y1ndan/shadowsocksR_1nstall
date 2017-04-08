# shadowsocksR-oneclick一键式安装脚本

本脚本修改于 teddysun 的一键脚本： https://shadowsocks.be/9.html

##安装方法##：
----
wget https://raw.githubusercontent.com/Sherlockwoo/shadowsocksR_1nstall/master/shadowsocksR.sh && bash shadowsocksR.sh

--------------------------------------------------------------------

## 系统要求 ##

CentOS 6+ / Debian 6+ / Ubuntu 14.04 +

推荐 Debian 7 x64，这个是我一直使用的系统，我的脚本在这个系统上面出错率最低。并且最容易安装锐速（锐速不支持OpenVZ）

CentOS根据大家的要求，加入了CentOS 6和7的支持，CentOS 7 自带防火墙问题自行解决，其他版本没有做测试。

## 脚本版本 ##

- Ver: 2.0.3

## 脚本特点：##

目前网上的各个ShadowsocksR脚本基本都是只有 安装/启动/重启 等基础功能，对于小白来说还是不够简单方便。既然是一键脚本，那么就要尽可能地简单，小白更容易接受使用！

- 支持 限制 端口限速
- 支持 限制 端口设备数
- 支持 显示 当前连接IP
- 支持 显示 SS/SSR连接+二维码
- 支持 切换管理 单/多端口
- 支持 一键安装 锐速
- 支持 一键安装 BBR
- 支持 一键封禁 垃圾邮件(SMAP)/BT/PT


## 安装步骤 ##

    wget -N --no-check-certificate https://github.com/Sherlockwoo/shadowsocksR_1nstall/raw/master/ssr.sh && chmod +x ssr.sh && bash ssr.sh

## 使用说明 ##

运行脚本

    bash ssr.sh

输入对应的数字来执行相应的命令

请输入一个数字来选择菜单选项
 
 1. 安装 ShadowsocksR
 2. 更新 ShadowsocksR
 3. 卸载 ShadowsocksR
 4. 安装 libsodium(chacha20)
————————————
 5. 查看 账号信息
 6. 显示 连接信息
 7. 设置 用户配置
 8. 手动 修改配置
 9. 切换 端口模式
————————————
 10. 启动 ShadowsocksR
 11. 停止 ShadowsocksR
 12. 重启 ShadowsocksR
 13. 查看 ShadowsocksR 日志
————————————
 14. 配置 锐速
 15. 配置 BBR
————————————
 16. 其他功能
 
 注意事项： 锐速/BBR 不支持 OpenVZ
 
 当前状态: 已安装 并 已启动
 当前模式: 单端口
 
请输入数字(1-16)：

当你为 单端口模式时，使用 7. 设置 用户配置 是 修改 单端口账号配置。

当你为 多端口模式时，使用 7. 设置 用户配置 是 添加/删除/修改 多端口账号配置。

## 文件位置 ##

安装目录：/usr/local/shadowsocksr

配置文件：/etc/shadowsocksr/user-config.json

#  其他说明 ##

ShadowsocksR 安装后，自动设置为 系统服务，所以支持使用服务来启动/停止等操作，同时支持开机启动。

启动 ShadowsocksR：service ssr start
停止 ShadowsocksR：service ssr stop
重启 ShadowsocksR：service ssr restart
查看 ShadowsocksR状态：service ssr status
ShadowsocksR 默认支持UDP转发，服务端无需任何设置。

本脚本已经集成了 安装/卸载 锐速(ServerSpeeder)开心版，但是是否支持请查看 Linux支持内核列表 。（锐速不支持OpenVZ）


## 参考资料 ##
[doub.io](https://doub.io/ss-jc42/)
