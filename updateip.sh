#!/bin/bash
#if [[ -n "$(curl ifconfig.me)" ]];then
#      IPADDRESS="$(curl ifconfig.me)"
#fi

#使用curl命令通过网站ip.cn获取本机外网命令
IPADDRESS="$(curl ip.cn | sed -e 's/^.*P：//' -e 's/.来自.*通//')"
#以下是其他几种获取ip的方式
#IPADDRESS=`wget http://ipecho.net/plain -O - -q;echo`

#清空日志条目,防止日志文件一直增加
sed -i '1,$d' $PREFIX/updateip.log
echo "Last check at: $(date)" >> $PREFIX/updateip.log

if [[ "${IPADDRESS}" != "$(cat $PREFIX/.current_ip)" ]];then
   if echo "${IPADDRESS}" | mutt -s "new ip" 55701240@qq.com ;then
      echo "Ip change from $(cat $PREFIX/.current_ip) to ${IPADDRESS}" >> /root/rootcrons/updateip.log
      echo ${IPADDRESS} > $PREFIX/.current_ip
   else
      echo "Failed to send the mail, try again later." >> $PREFIX/updateip.log
    fi
fi

exit 0
#echo ${IPADDRESS} | mutt -s \[RPI\]"IP CHANGED" 55701240@qq.com
#echo "hello world" | mutt -s "title" 55701240@qq.com
