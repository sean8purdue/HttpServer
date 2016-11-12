# CS252 Prjoect5 _ Web Server

Programmer:  Sean 

sean8purdue@gmail.com

November 8th, 2016

---------------

## Part1

1.Test for `perror("TestPerror")`;

perror just print the String, the program still continue running through.


~~~
➜  lab5 git:(feature/part1) ✗ daytime-server 1200
TestPerror: Success
name=HELLOgg
^C
~~~


2.Test `listen(masterSocket, QueueLength)`;

**???**
It seems like QueueLength is the maximum connection that masterSocket can wait? Not sure about this.

Put socket in listening mode and set the size of the queue of unprocessed connections

~~~cpp
  error = listen( masterSocket, QueueLength);
  if ( error ) {
    perror("listen");
    exit( -1 );
  }

~~~
