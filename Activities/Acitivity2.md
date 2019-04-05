# Activity 2 FIND and XARGS  
Spaces are Bad in filenames, try to avoid them...  

## find  

1. Navigate to where you cloned the Book git repository.  
2. Use ls on your repository  
	`ls ./bds-files`  
3. Next use `find ./bds-files`  

Describe the difference between the two programs  

find  

---  

ls  

---  


### Find filenames with find  

Next lets `find` all the locations of the README.md in bds-files  

1. Navigate to the bsd-files parent folder  
2. use `find ./bds-files/ -name README.md`  
3. Compare the output if you used `-name *.md` or `-name README*`  

Now we are going to make some fake fastq files to practice with  
1. Make a new directory titled data `mkdir data`  
2. Create a subdirectory in data `mkdir seq`  
3. Make some fastq seq files  
	`touch seqs/zmays{A,B,C}_R{1,2}.fastq`  
	
- [ ] Find all files matching name "zmaysB"  
- [ ] Find all files that match zmaysB or zmaysC  
- [ ] Provide two ways to find zmaysA and zmaysB fastq files  

### Common find expressions  
| Operator/expression | Description |
|--- | --- |  
| -name <pattern> | Match a filename to <pattern>, using the same special characters (*, ?, and [...] as Bash) |
| -iname <pattern> | Identical to -name, but is case insensitive |
| -empty | Matches empty files or directories |
| -type <x> | Matches types x (f for files, d for directories, l for links) |
| -size <size> | Matches files where the <size> is the file size (shortcuts for kilobytes (k), megabytes (M), gigabytes (G), and terabytes (T) can be used); sizes preceded with + (e.g., 50M) match files at least this size; sizes preceded with -(e.g., -50M) match files at most this size |
| -regex | Match by regular expression (extended regular expressions can be enabled with -E) |
| -iregex | Identical to -regex, but is case insensitive |
| -print0 | Separate results with null byte, not newline |
| expr -and expr | Logical “and” |
| expr -or expr | Logical “or” |
| -not / "!"expr | Negation |
| (expr) | Group a set of expression |  

### One more find example  


Suppose that a messy collaborator decided to create a file named zmaysB_R1-temp.fastq in seqs/  
You can use the following commands to filter out the messy filename, and repremand the collaborator later lol  

`touch seqs/zmaysB_R1-temp.fastq` this creates the messy filename  
`find seqs -type f "!" -name "zmaysC*fastq"`  

You don’t want to delete his file or rename it, because your collaborator may  
need that file and/or rely on it having that specific name. So, the best way to  
deal with it seems to be to change your `find` command and talk to your  
collaborator about this mystery file later. Luckily, `find` allows this sort of  
advanced file querying:  

`find seqs -type f "!" -name "zmaysC*fastq" -and "!" -name "*-temp*"`  



## find -exec: Running commands on finds results  

Let’s look at a simple example to understand how -exec works. Continuing  
from our last example, suppose that a messy collaborator created numerous  
temporary files. Let’s emulate this (in the /data/seqs directory):  
`touch zmays{A,C}_R{1,2}-temp.fastq` creates some messy filenames  

find will let us locate the messy files and delete them:  
`find . -name "*-temp.fastq" -exec rm -i {} `  
Notice the -i flag produces an interactive mode  


# xargs: A Unix Powertool  

xargs takes standard input as arguments:  
Lets repeat the previous examples results (removing files) by using xargs  
1. Recreate mystery files  
	`touch zmays{A,C}_R{1,2}-temp.fastq`  
2. Use find to locate filenames  
	`find . -name "*-temp.fastq"`  
3. Pipe find to xargs and rm  
	`find . -name "*-temp.fastq" | xargs rm`  
	
If we wanted to inspect a long list of files `find` returns before running `rm` on  
all files in this list, we could use:  

1. Recreate mystery files  
	`touch zmays{A,C}_R{1,2}-temp.fastq`
2. Find files and create file
	`find . -name "*-temp.fastq" > files-to-delete.txt`  
3. Print file contents to stdout  
	`cat files-to-delete.txt`  
4. Use xargs to remove files  
	`cat files-to-delete.txt | xargs rm`  


Additionally we can use xargs to place arguments after a command in a bash script  
1. Recreate mystery files  
	`touch zmays{A,C}_R{1,2}-temp.fastq`  
2. find, and add string to each file  
	`find . -name "*-temp.fastq" | xargs -n 1 echo "rm -i" > delete-temp.sh`  
3. Run the bash file  
	`bash delete-temp.sh`  

xargs can be used for more complex program arguments  
By using -I {} we can place arguments exactly where we want them to be  

If zmaysA_R1.fastq is the input what would populate each {}?  

`find . -name "*.fastq" | xargs basename -s ".fastq" | \  
xargs -I{} fastq_stat --in {}.fastq --out ../summaries/{}.txt`  


# Make and Makefiles: Another Option for Pipelines  
Make and makefiles can allow for an alternative way to generate pipelines.  
Lets look at a pipeline that downloads a file and makes a summary:  
1. Navigate to Chapter12 directory  
2. Explore the makefile  
	`cat` `less` etc  
	describe each section of the makefile (description in book chapter)  
3. use `make all` to download the file  
4. check the contents of the new files  
	The .txt file has the following format  
Output format: chr, length, #A, #C, #G, #T, #2, #3, #4, #CpG, #tv, #ts, #CpG-ts  




























