#!/usr/bin/env bash
parameters="$@"
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
    --type*)
	echo "--type is not supported by the module, please run the script without --type"
	exit 1
	;;
esac
shift
done

if `mongoexport $parameters --type=json` ; then
	echo "Json file exported, converting it to tsv"
	node convert.js $output $fields
	rm $output
fi
