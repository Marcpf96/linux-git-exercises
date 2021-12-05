#! /bin/sh

mkdir -p /backup/$(whoami)/$(date +%Y/%m/%d)/

cp nginx_requests_total.txt /backup/$(whoami)/$(date +%Y/%m/%d)/nginx_log_requests_$(date +%Y%m%d).log

echo $(date +%w)

if [ $(date +%w) -eq 7 ]
then
        cp /backup/$(whoami)/$(date  --date=' 1 days ago' +%Y/%m/%d)/nginx_log_requests_$(date  --date=' 1 days ago' +%Y%m%d).log /backup/$(whoami)/$(date +%Y/%m/%d)/

        cp /backup/$(whoami)/$(date  --date=' 2 days ago' +%Y/%m/%d)/nginx_log_requests_$(date  --date=' 2 days ago' +%Y%m%d).log /backup/$(whoami)/$(date +%Y/%m/%d)/

        cp /backup/$(whoami)/$(date  --date=' 3 days ago' +%Y/%m/%d)/nginx_log_requests_$(date  --date=' 3 days ago' +%Y%m%d).log /backup/$(whoami)/$(date +%Y/%m/%d)/

        cp /backup/$(whoami)/$(date  --date=' 4 days ago' +%Y/%m/%d)/nginx_log_requests_$(date  --date=' 4 days ago' +%Y%m%d).log /backup/$(whoami)/$(date +%Y/%m/%d)/

        cp /backup/$(whoami)/$(date  --date=' 5 days ago' +%Y/%m/%d)/nginx_log_requests_$(date  --date=' 5 days ago' +%Y%m%d).log /backup/$(whoami)/$(date +%Y/%m/%d)/

        cp /backup/$(whoami)/$(date  --date=' 6 days ago' +%Y/%m/%d)/nginx_log_requests_$(date  --date=' 6 days ago' +%Y%m%d).log /backup/$(whoami)/$(date +%Y/%m/%d)/


        tar -czvf nginx_logs_$(date +%Y%m%d).tar.gz /backup/$(whoami)/$(date +%Y/%m/%d)/

else
  echo "not today"
fi