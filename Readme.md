# Mongoexport-TSV
A wrapper on mongoexport to export the dump in tsv format. 
It uses mongoexport to get the dump in json and then run a node script to convert it into
tsv.

### Prerequisites

 1. Node.js
 2. mongoexport

### Setup
 1. npm install

### Running the scripts
NOTE:
 1. Use any argument you wish to pass to mongoexport, except --type (doesn't make any sense) and --fieldFile which is not supported yet.
 2. White spaces are not allowed in the values e.g. '{$where:" this.text.length>1000"}' (having space in query) will not work. 
 ```
 ./mongoexportTSV.sh --db mydb --collection=articles --out ./urls.json --fields link,summary,title --query '{$where:"this.text.length>1000"}'
```

## TODO:
 1. Support --fieldFile 
 2. Support white spaces in the query.
 3. Add test Script
