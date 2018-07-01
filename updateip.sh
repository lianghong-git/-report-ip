#!/bin/bash
#if [[ -n "$(curl ifconfig.me)" ]];then
#      IPADDRESS="$(curl ifconfig.me)"
#fi
#使用curl命令通过网站ip.cn获取本机外网命令
IPADDRESS="$(curl ip.cn | sed -e 's/^.*P：//' -e 's/.来自.*通//')"
#清空日志条目,防止日志文件一直增加
sed -i '1,$d' /root/rootcrons/updateip.log
#IPADDRESS='wget http://ipecho.net/plain -O - -q;echo'
echo "Last check at: $(date)" >> /root/rootcrons/updateip.log

if [[ "${IPADDRESS}" != "$(cat /root/rootcrons/.current_ip)" ]];then
   if echo "${IPADDRESS}" | mutt -s "new ip" 55701240@qq.com ;then
      echo "Ip change from $(cat /root/rootcrons/.current_ip) to ${IPADDRESS}" >> /root/rootcrons/updateip.log
      echo ${IPADDRESS} > /root/rootcrons/.current_ip
   else
      echo "Failed to send the mail, try again later." >> /root/rootcrons/updateip.log
    fi
fi
#echo ${IPADDRESS} | mutt -s \[RPI\]"IP CHANGED" 55701240@qq.com
#echo "hello world" | mutt -s "title" 55701240@qq.com
