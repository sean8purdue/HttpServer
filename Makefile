CXX = g++ -fPIC
# add gdb output
#CXX = g++ -g -fPIC
NETLIBS= -lnsl -lpthread

all: daytime-server daytime-client use-dlopen hello.so myhttpd

daytime-client : daytime-client.o
	$(CXX) -o $@ $@.o $(NETLIBS)

daytime-server : daytime-server.o
	$(CXX) -o $@ $@.o $(NETLIBS)

myhttpd : myhttpd.o
	$(CXX) -o $@ $@.o $(NETLIBS)

use-dlopen: use-dlopen.o
	$(CXX) -o $@ $@.o $(NETLIBS) -ldl

hello.so: hello.o
	ld -G -o hello.so hello.o

%.o: %.cc
	@echo 'Building $@ from $<'
	$(CXX) -o $@ -c -I. $<

#git-commit:
#	git add *.h *.cc >> .local.git.out
#	git commit -a -m "Commit Web Server" >> .local.git.out || echo
#	git push

clean:
	rm -f *.o use-dlopen hello.so
	rm -f *.o daytime-server daytime-client myhttpd

