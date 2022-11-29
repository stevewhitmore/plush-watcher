#!/bin/bash

### Specify python path for container
PATH=$PATH:/usr/local/bin
export SHOP_URL="https://www.shopwarriorcats.com/collections/plushes-homeware/products/graystripe-large-plush-cat-1"
# export SHOP_URL="https://www.shopwarriorcats.com/collections/plushes-homeware/products/jayfeather-large-plush-cat"

scan_result=$(python plush_watcher.py)

if [[ -n $scan_result ]]; then
    echo -e "Warriors plush found! Visit ${SHOP_URL} asap. \n\n
    $scan_result \n" \
        | mutt -s "Warriors Plush Scan" "$EMAIL"
fi

mkdir -p ../logs
echo -e "Scan completed at $(date). \nResult: [$scan_result] \n" >> ../logs/scan_log.txt

