# Chapter 12 - Bioinformatics shell scripting, writing pipelines, and parallelizing tasks

## Activity 1 - Scripts, Conditionals, and Loops

### Scripts

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

Alternatively, if you have root access, scripts (or the directory in which the script is located) can be added to $PATH to allow for calling the script without `bash` or `./`.

