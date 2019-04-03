# Challenge (have a BLAST ;)

db folder contains database to blast  
[for blast parameters](https://www.ncbi.nlm.nih.gov/books/NBK279684/)  

input sequence folder contains query  

Your goal, should you choose to accpet it is to roughly annotate query sequence  
with blast.

1. Download BLAST package  
  1. ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.9.0+x-x64-linux.tar.gz  
2. clone the github repository  
  * https://github.com/Cfernz/Chapter12-challenge  
3. use shasum -c to check for files integrity  
4. Set up a bash script that includes the following:  
  * Arguments (positional or flags) for the script to call  
  * Loop that takes files and passes them to BLAST  
  * BLAST (arguments should be taken from the initial command line)  

