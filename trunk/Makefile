ARCH := $(shell uname -m)
X64 = x86_64
CC = gcc
PROGS =	magent
ifeq ($(ARCH), $(X64))
	M64 = -m64
	LIBS = /usr/lib64/libevent.a /usr/lib64/libm.a 
else
	LIBS = -levent -lm -L/usr/local/lib
endif

CFLAGS = -Wall -g -O2 -I/usr/local/include $(M64)

all: $(PROGS)

STPROG = magent.o ketama.o

ketama.o: ketama.c ketama.h
	$(CC) $(CFLAGS) -c -o $@ ketama.c

magent.o: magent.c ketama.h
	$(CC) $(CFLAGS) -c -o $@ magent.c

magent: $(STPROG)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

clean:
	rm -f *.o *~ $(PROGS) tags
