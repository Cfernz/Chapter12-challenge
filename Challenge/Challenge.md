# Challenge (have a BLAST ;)

db folder contains database to blast  
  

input sequence folder contains query  

A bacterial outbreak has occured, the CDC is calling upon you (yes YOU) to identify the bacteria  
based off 16s rRNA gene sequence. Sucessful ID of sequence will allow for efficient treatment.  
You are our last hope...  


1. Download BLAST package  
	ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.9.0+x-x64-linux.tar.gz  
2. Extract the package  
	`gunzip <file> | tar -xf -`  
2. clone the github repository  (should already be done)  
  * https://github.com/Cfernz/Chapter12-challenge  
3. use shasum -c to check for files integrity  
4. Write a bash script that will blast each file in the query folder  



HINTS  
There are many ways to do this.  
Google is your friend.  
You may think about including:  
  * Arguments (positional or flags) for the script to call  
  * Loop that takes files and passes them to BLAST  
  * BLAST (arguments should be taken from the initial command line)  
  * BLAST comes as an executable, you will need to provide the absolute path to the program for it to work.  



[command line blast parameters](https://www.ncbi.nlm.nih.gov/books/NBK279684/)
