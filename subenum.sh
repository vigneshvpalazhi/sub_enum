#! /bin/bash




domain=$1

assetfinder -subs-only $1 > subdomains.txt



cat subdomains.txt | httprobe > subdomains_live.txt










file=subdomains_live.txt
cp $file tmp_subs.txt
while read url ; do

          echo ${url#*//} >> urls.txt
    
done < tmp_subs.txt

sort -u urls.txt > $2

#if want to change the name to file that we need to save change the name of sortedsubs.txt

rm -r tmp_subs.txt

rm -r urls.txt

rm -r subdomains.txt

rm -r subdomains_live.txt

echo "subdomain enumeration of $1 domain has been save to $2"
