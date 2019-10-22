var FS = require('fs');
var through = require('through');
var ES = require('event-stream');
var newLineChar = "\n";


(function(){
	var 
		readFileName = process.argv[2],
		writeFileName = readFileName.substr(0, readFileName.lastIndexOf(".")) + ".tsv",
		columns = process.argv[3].split(','),
		rstream = FS.createReadStream(readFileName),
		//Using the append mode to prevent the headers getting flushed
		wstream = FS.createWriteStream(writeFileName, {flags : 'a'});
	//Write the headers
	FS.writeFileSync(writeFileName, columns.join('\t') + newLineChar);
	rstream.pipe(
		ES.split()
).pipe(through(
		function write(data) {
			try {
			if(!data)
				return;
			dataJson = JSON.parse(data.toString());
			dataStr = "";
			columns.forEach(function(col){
				//add tab, replace the new line and tab characters with spaces and encode the string with double quotes
				dataStr +=  (dataJson[col] ? dataJson[col].toString().replace(/[\r\n\t]+/g, " ") : " ") + "\t";
			});
			dataStr += newLineChar;	
			
			} catch(e) {
				console.error(e);
				return;
			}
			this.queue(dataStr);			

		}, function end() {
			this.queue(null);
			console.log(writeFileName + " created!");
		}
	)).pipe(wstream);

}());

