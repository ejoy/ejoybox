#!/bin/bash

WORKDIR=/srv/s3intdev/ejoybox_github/ejoybox

cd ${WORKDIR}

curl -s https://raw.githubusercontent.com/ejoy/ejoybox/main/S3-CN-OB-Publish/ob_v5/Newest/version.conf -o /tmp/p10445_version.conf
diff S3-CN-OB-Publish/ob_v5/Newest/version.conf /tmp/p10445_version.conf
if [ $? -ne 0 ] ; then
	echo "close rewrite p10445_version.config to nginx at $(date)" >> /tmp/p10445_hotfix_switch.log
	sudo cp p10445-ob-hotfix.ejoy.com.conf_close /etc/nginx/sites-enabled/p10445-ob-hotfix.ejoy.com.conf
	sudo nginx -s reload
fi


##
#curl -s https://raw.githubusercontent.com/ejoy/ejoybox/main/S3-CN-OB-Publish/ob_v5/Newest/version_mobile.conf -o /tmp/p10445_version_mobile.conf
#diff S3-CN-OB-Publish/ob_v5/Newest/version_mobile.conf /tmp/p10445_version_mobile.conf
#if [ $? -ne 0 ] ; then
#	echo "close rewrite p10445_version_mobile config to nginx at $(date)" >> /tmp/p10445_hotfix_switch.log
#	sudo cp p10445-ob-hotfix.ejoy.com.conf_close /etc/nginx/sites-enabled/p10445-ob-hotfix.ejoy.com.conf
#	sudo nginx -s reload
#fi
