#!/bin/bash

WORKDIR=/srv/s3intdev/ejoybox_github/ejoybox

cd ${WORKDIR}

git config --global push.default simple

rsync -av /var/www/html/S3-CN-OB-Publish/ob_v5/Newest/*.conf S3-CN-OB-Publish/ob_v5/Newest/.
git add .
git commit -a -m "fix"
git push
