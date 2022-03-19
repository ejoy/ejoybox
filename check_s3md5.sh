#!/bin/bash

curl -s https://raw.githubusercontent.com/ejoy/ejoybox/main/S3-CN-OB-Publish/ob_cn_3d/Newest/version_pc.conf -o /tmp/p10445_version_pc.conf
diff S3-CN-OB-Publish/ob_cn_3d/Newest/version_pc.conf /tmp/p10445_version_pc.conf
echo $?

##
curl -s https://raw.githubusercontent.com/ejoy/ejoybox/main/S3-CN-OB-Publish/ob_cn_3d/Newest/version_mobile.conf -o /tmp/p10445_version_mobile.conf
diff S3-CN-OB-Publish/ob_cn_3d/Newest/version_mobile.conf /tmp/p10445_version_mobile.conf
echo $?
