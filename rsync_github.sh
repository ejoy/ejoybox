#!/bin/bash

WORKDIR=/srv/s3intdev/ejoybox_github/ejoybox

cd ${WORKDIR}

TM=$(date +'%y%m%d%H%M%S')

git config --global push.default simple

rsync -av /var/www/html/S3-CN-OB-Publish/ob_v5/Newest/*.conf S3-CN-OB-Publish/ob_v5/Newest/.
git commit -a -m "${TM}:hear_no_evil:"
git push
