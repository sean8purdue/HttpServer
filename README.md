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

## Memory Dump for Debug

* Output send contents on Server Screen

Like this

~~~
➜  Desktop telnet data.cs.purdue.edu 1200
Trying 128.10.2.13...
Connected to data.cs.purdue.edu.
Escape character is '^]'.

Type your name:first try

Hi first try the time is:
Fri Nov 11 23:32:32 2016

Connection closed by foreign host.

--------------

➜  lab5 git:(feature/memdumpDebug) ./daytime-server 1200
name=first try

Hi first try the time is:
Fri Nov 11 23:32:32 2016

---------------------------------
Old Version output:

➜  lab5 git:(feature/memdumpDebug) ./daytime-server 1200
name=first try

~~~

* Memdump request and send of server

Recover daytime-server.cc to old version, create two new files for memdump and output sending contents on server screen.

1. Memdump sending contents from server

The output of server screen should be like this:

~~~
➜  Desktop telnet data.cs.purdue.edu 1200
Trying 128.10.12.13...
Connected to data.cs.purdue.edu.
Escape character is '^]'.

Type your name:lg

Hi lg the time is:
Sat Nov 12 00:25:22 2016

Connection closed by foreign host.

--------------

➜  lab5 git:(feature/memdumpDebug) ✗ daytime-server 1200
name=lg
<0x0a,.><0x48,H><0x69,i><0x20, ><0x6c,l><0x67,g><0x20, ><0x74,t><0x68,h><0x65,e><0x20, ><0x74,t><0x69,i><0x6d,m><0x65,e><0x20, ><0x69,i><0x73,s><0x3a,:><0x0a,.><0x53,S><0x61,a><0x74,t><0x20, ><0x4e,N><0x6f,o><0x76,v><0x20, ><0x31,1><0x32,2><0x20, ><0x30,0><0x30,0><0x3a,:><0x32,2><0x35,5><0x3a,:><0x32,2><0x32,2><0x20, ><0x32,2><0x30,0><0x31,1><0x36,6><0x0a,.><0x0a,.>

~~~

2. Memdump request from clinet

The telnet server output of server screen should be like this:

~~~
➜  ~ telnet data.cs.purdue.edu 1200
Trying 128.10.12.13...
Connected to data.cs.purdue.edu.
Escape character is '^]'.

Type your name:lg

Hi lg the time is:
Sat Nov 12 00:35:17 2016

Connection closed by foreign host.

---------------------

➜  lab5 git:(feature/memdumpDebug) ✗ daytime-server 1200
<0x6c,l>
<0x67,g>
<0x0d,.>  //0d is CR, carriage return
<0x0a,.>  //0a is LF, new line
name=lg
<0x0a,.><0x48,H><0x69,i><0x20, ><0x6c,l><0x67,g><0x20, ><0x74,t><0x68,h><0x65,e><0x20, ><0x74,t><0x69,i><0x6d,m><0x65,e><0x20, ><0x69,i><0x73,s><0x3a,:><0x0a,.><0x53,S><0x61,a><0x74,t><0x20, ><0x4e,N><0x6f,o><0x76,v><0x20, ><0x31,1><0x32,2><0x20, ><0x30,0><0x30,0><0x3a,:><0x33,3><0x32,2><0x3a,:><0x32,2><0x36,6><0x20, ><0x32,2><0x30,0><0x31,1><0x36,6><0x0a,.><0x0a,.>
~~~

If use chrome to visit this server, the output should be like this:

~~~
➜  lab5 git:(feature/memdumpDebug) ✗ daytime-server 1200
<0x47,G><0x45,E><0x54,T><0x20, ><0x2f,/><0x20, ><0x48,H><0x54,T><0x54,T><0x50,P><0x2f,/><0x31,1><0x2e,.><0x31,1><0x0d,.><0x0a,.>
name=GET / HTTP/1.1
<0x0a,.><0x48,H><0x69,i><0x20, ><0x47,G><0x45,E><0x54,T><0x20, ><0x2f,/><0x20, ><0x48,H><0x54,T><0x54,T><0x50,P><0x2f,/><0x31,1><0x2e,.><0x31,1><0x20, ><0x74,t><0x68,h><0x65,e><0x20, ><0x74,t><0x69,i><0x6d,m><0x65,e><0x20, ><0x69,i><0x73,s><0x3a,:><0x0a,.><0x53,S><0x61,a><0x74,t><0x20, ><0x4e,N><0x6f,o><0x76,v><0x20, ><0x31,1><0x32,2><0x20, ><0x30,0><0x30,0><0x3a,:><0x33,3><0x37,7><0x3a,:><0x33,3><0x39,9><0x20, ><0x32,2><0x30,0><0x31,1><0x36,6><0x0a,.><0x0a,.>
~~~

