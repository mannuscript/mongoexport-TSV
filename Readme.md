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

```
 ./mongoexportTSV.sh --db mydb --collection=articles --out ./urls.json --fields link,summary,title
 # Please note that --type is not supported by the file and it doesn't make any sense to use it
```

## TODO:
 1. Support --fieldFile 
 
## Issues:
 1. Please create an issues if you find any fault.
