#!/bin/bash

WORKDIR=/srv/s3intdev/ejoybox_github/ejoybox

cd ${WORKDIR}

rsync -av /srv/s3intdev/s3-i18n-publish/s3g_ob_merge_20211014/Newest/*.conf s3-i18n-publish/s3g_ob_merge_20211014/Newest/.
git add .
git commit -a -m "fix"
git push
