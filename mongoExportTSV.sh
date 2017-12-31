#!/usr/bin/env bash
#Get the json file
#echo "$@"	
mongoexport --db rss --collection articles --out urls.json --type=json --fields link,summary,title

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -o|--out)
    	output="$2"
    	shift
    	;;
    --out*)
    	output=`echo $1 | sed -e 's/^[^=]*=//g'`
    	shift
    	;;
    -f|--fields)
    	fields="$2"
    	shift
    	;;
    --fields*)
	fields=`echo $1 | sed -e 's/^[^=]*=//g'`
	shift
	;;
esac
shift
done
echo "Json file exported, converting it to tsv"
node convert.js $output $fields
rm $output
