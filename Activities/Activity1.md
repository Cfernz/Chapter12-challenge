# Chapter 12 - Bioinformatics shell scripting, writing pipelines, and parallelizing tasks
## Activity 1 - Scripts, Conditionals, and Loops
If you have not done so already, make sure you have the book files for chapter 12:
```
#navigate to directory that you want to work in
mkdir chapter12-files #or whatever name you like
git clone https://github.com/vsbuffalo/bds-files.git
cp -r bds-files/chapter12-pipelines/* chapter12-files/
``` 
### Scripts, Variables, and Arguments
Bash scripts are shell scripts most often used to glue commands together into a workflow.
They make running commands over many files much quicker, but we then lose the ability to carefully check every step for errors. As such, we need a **robust header**.
```
#!/bin/bash	#shebang - specifies path to the interpreter

set -e		#terminates script if any script has nonzero exit status
set -u		#terminates script if any variable is unset
set -o pipefail	#if any command/program returns a nonzero exit status, the whole pipe returns nonzero
```

Running scripts can be run with either `$ bash script.sh` or `$ ./script.sh`, but the script must be executable.
(remember `chmod`!!)
Alternatively, if you have root access, scripts (or the directory in which the script is located) can be added to $PATH to allow for calling the script without `bash` or `./` from any directory.

Practice writing a script! (this can be done using your text editor of choice)
```
#!/bin/bash
#hello.sh
echo "Hello World!"
```
Now you can run your script. What do you see?
We will add on to this script throughout the activity.

#### Variables
Variables are used to store information in a script (ex. input files, output directories, etc.)
Try the following commands:
	`outputDir="output/"`
	`echo $outputDir`
What happens if you try to call it without the dollar sign? What happens if you try to specify a variable without quotes or a space? (`outputDir=output files/`)

Now lets use variables in our script:
```
#!/bin/bash
#hello.sh

name="enteryourname"
echo "Hello, $name, how are you?"
```
Bonus activity: Try keeping `$name` in the script, but remove the specification (`name="yourname"`). What happens? What if `set -u` is set? 
Other things to keep in mind: Avoid spaces in variable names and specfications. Use quotes. Curly brackets `{}` can be used to demarcate variable names (see the book examples, we won't go through those now).

#### Arguments
Instead of specifying variables in the script, we can provide information through command line arguments.
```
#!/bin/bash
#hello.sh

name=$1
month=$2
date=$3

echo "Hello, $name, it is $month $date."

```
Now call the script. What do you get? What happens if you don't specify all the arguments? What happens if you don't specify the arguments and `set -u` is set? Move on to the next section to see how you can make the script throw a more human-friendly error if arguments aren't specified.
Bonus: How can you make the script tell you what the name of the script is?

### Conditionals and Loops
#### Conditionals
Recall that conditionals are `if` statements that allow us to check whether certain criteria are met before running a command.
How can you use and `if` statement to print an error message telling a user if not enough argument are provided to the `hello.sh` script?
Here's a start, but you can check the `hello-final.sh` script from the repository if you get stuck.
```
#!/bin/bash
#hello.sh

name=$1
month=$2
date=$3

if [ command ]
then
        echo "error: too few arguments, you provided $#, 3 required."
        echo "usage: hello.sh name month date"
        exit 1
else
        [else statement] #hint - you already have this statement
fi
```
##### working with `test`
`test` is usually used to check whether a file or directory exists.
First make a test directory and a number of test files:
```
mdkir testdir
touch testdir/testfile{A,B,C}.{fq,bam,sam} #remember brace expansions?!
```
Now try:
```
test -d testdir ; echo $?
test -f testdir/testfileA.sam ; echo $?
test -w testdir/testfileA.sam ; echo $?
```
What do you get for each?
Try combining `test` with an `if` statement.

#### For loops
We can use loops to perform the same set of commands on multiple files.
First let's practice simple globbing.
How can we get a list of all the .bam files in `testdir` using a loop?
```
#!/bin/bash
#loop.sh

for file in testdir/*.bam
do
	echo "$file is a bam file"
done
```
How could you do this using variables or arguments instead?
Now let's do a more complicated example.
You will need the chapter12 files from the bds repository. See the beginning of this document for info on how to get them if you don't already have them.
Start by getting files to be processed into a bash array.
```
#!/bin/bash
#array-loop.sh

sample_info=samples.txt

sample_files=($(cut -f 3 "$sample_info"))

```
Now we can see what is in the array using `echo` commands. 
Use the key to answer the following questions. <array> = the name of the array
all commands should be preceded by `echo`
| Key ||
| --- | --- |
| command | output |
| ------- | ------ |
| ${<array>[n]} | nth item in array |
| ${<array>[@]} | all items in array |
| ${#<array>[@]} | number of items in array |
| ${!<array>[@]} | index of each item in array |

How many items are there in the array?
What is the 3rd item?
Is the array 0 or 1 indexed?

Let's add to the script to get the names of results files using `basename`.
Add the following lines to your script:
```
for fastq_file in ${sample_files[@]}
do
	results_file="$(basename $fastq_file .fastq)-stats.txt" 
	#how could the basename command be changed but still produce the same output?
	echo $results_file
done
```
Run the script. What do you see?

Finally, we can add in a command to perform on each file. Remove the `echo $results_file` and add the following:
```
echo "fastq_stat $fastq_file > stats/$results_file"
```
Now what do you see when you run the script?
Note that this was not running an actual command - fastq_stat is an imaginary program, and we simply echoed what the command would look like.
Using echo is a great way to make sure commands in a loop look correct before running them!!
Things to think about:
How could you rewrite the script to use an argument instead of coding the variable into the script?
What would happen if filenames had spaces? (You could test this by creating an array from files.txt and running the loop)

End of Activity 1, hopefully it didn't throw you for a loop....






