#!/bin/bash

WORKDIR=/srv/s3intdev/ejoybox_github/ejoybox

cd ${WORKDIR}

TM=$(date +'%y%m%d%H%M%S')

git config --global push.default simple
##
rsync -av /var/www/html/S3-CN-OB-Publish/ob_v5/Newest/*.conf S3-CN-OB-Publish/ob_v5/Newest/.
#rsync -av /var/www/html/s3-i18n-publish/s3g_ob_merge_20211014/Newest/*.conf s3-i18n-publish/s3g_ob_merge_20211014/Newest/.
#rsync -av /var/www/html/s3-i18n-client/s3g_ob_merge_20211014/Newest/*.conf s3-i18n-client/s3g_ob_merge_20211014/Newest/.
git add .
git commit -a -m "${TM}:hear_no_evil:"
git push


#export AWS_ENDPOINT_URL=https://710b556bf0edd48dfb6c4625315eb3ad.r2.cloudflarestorage.com/thislinux
#aws s3 cp S3-CN-OB-Publish s3://S3-CN-OB-Publish/ --recursive --include "*.conf"
export AWS_ENDPOINT_URL=https://710b556bf0edd48dfb6c4625315eb3ad.r2.cloudflarestorage.com
aws s3 sync ${WORKDIR}/S3-CN-OB-Publish s3://s3publish/S3-CN-OB-Publish
