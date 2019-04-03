# Activity 2 FIND and XARGS  
Spaces are Bad in filenames, try to avoid them...  

## find  

1. Navigate to where you cloned the Book git repository.  
2. Use ls on your repository  
	`ls ./<your git repo>` (replace path with your repo bds-files)  
3. Next use `find ./bds-files`  

Describe the difference between the two programs  

| find                 | ls               |
| -------------------- | ---------------- |
|                      |                  |





### Find filenames with find  

Next lets `find` all the locations of the README.md in bds-files  

1. Navigate to the bsd-files parent folder  
2. use `find ./bsd-files/ -name README.md`  
3. Compare the output if you used `-name *.md` or `-name README*`  

Now we are going to make some fake fastq files to practice with  
1. Make a new directory titled data `mkdir data`  
2. Create a subdirectory in data `mkdir seq`  
3. Make some fastq seq files  
	`touch seqs/zmays{A,B,C}_R{1,2}.fastq`  
	
[ ] Find all files matching name "zmaysB"  
[ ] Find all files that match zmaysB or zmaysC  
[ ] Provide two ways to find zmaysA and zmaysB fastq files  

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

