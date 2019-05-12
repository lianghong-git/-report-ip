#本脚本适合ip变化的外网,同时又需要操作者有路由器设置权限

#First,you should checkout if your systerm have been installed "mutt" and "curl" command
#一般系统默认安装有mutt发送邮件,其余都是系统自带工具.
#curl命令也可以获取ip地址.  curl config.me ,但config.me这个网站延迟太高.
#需要外IP和端口映射到内网,一般需要进行路由器设置就ok了
### 操作步骤：

1.在树莓派上登录Root账户（sudo -s），因为这个程序要放在/root/rootcrons下而且添加为root的例行程序。
2.执行git clone https://github.com/laixintao/Report-IP-hourly.git /root/rootcrons/下载脚本代码（如果放在别的目录下，要注意调整后面的步骤相应的路径）
3.执行crontab /root/rootcrons/rootcron，将rootcroon的任务添加到crontab列表中。
4.重启crontab，使配置立即生效。/etc/init.d/cron restart
