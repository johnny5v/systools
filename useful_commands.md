# Useful Linux commands
## nohup
nohup prevents the commands from hangup, which means, it can run in the background. The basic syntax is 
```
nohup sh your-script.sh &
``` 
It will craete a nohup.out under the directory you execute the command, logging the status. 

You can also customize the status file like:
```
nohup sh your-script.sh > /path/to/custom.out &
```
see [this article](https://www.maketecheasier.com/nohup-and-uses/) for more info.