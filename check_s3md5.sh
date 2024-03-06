#!/bin/bash

WORKDIR=/srv/s3intdev/ejoybox_github/ejoybox
OnFlag="$1"

cd ${WORKDIR}

time curl --connect-timeout 3 -s https://pub-21098e95ad6f4b47a238727ff79a8b7b.r2.dev/S3-CN-OB-Publish/ob_v5/Newest/version.conf -o /tmp/p10445_version.conf
time curl --connect-timeout 3 -s https://p10445-ob-hotfix-pp.ejoy.com/S3-CN-OB-Publish/ob_v5/Newest/version.conf -o /tmp/p10445_version_source.conf
curlack=$?
#diff S3-CN-OB-Publish/ob_v5/Newest/version.conf /tmp/p10445_version.conf
diff /tmp/p10445_version_source.conf /tmp/p10445_version.conf
diffack=$?
if [ $curlack -ne 0 ] || [ $diffack -ne 0 ] ; then
	echo "close rewrite p10445_version.config to nginx at $(date)" >> /tmp/p10445_hotfix_switch.log
	sudo cp p10445-ob-hotfix.ejoy.com.conf_close /etc/nginx/sites-enabled/p10445-ob-hotfix.ejoy.com.conf
	sudo nginx -s reload
	echo "version file redirect to github Off at $(date)" >> /tmp/p10445_version_switch.log
else
	echo "source file vs github file is same at $(date)"
	if [ "VVV$OnFlag" == "VVVOn" ] ; then
		sudo cp p10445-ob-hotfix.ejoy.com.conf_open /etc/nginx/sites-enabled/p10445-ob-hotfix.ejoy.com.conf
		sudo nginx -s reload
		echo "version file redirect to github On at $(date)" >> /tmp/p10445_version_switch.log
	fi
fi
