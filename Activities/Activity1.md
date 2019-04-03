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


