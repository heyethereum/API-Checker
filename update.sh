while [ 1 ]
do
	git pull origin main
	p=$(date +%Y)/$(date +%m)/$(date +%d)/$(date +%H)
	mkdir -p $p
	out=$p/$(date +%s).txt
	curl "http://api.open-notify.org/iss-now.json" > $out
	echo $out
	git add -A
	git commit -m "changed $(date +%s)"
	git push
	date
	sleep 60
done