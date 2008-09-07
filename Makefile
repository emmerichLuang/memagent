LIBS = -levent
CFLAGS = -Wall -O2 $(INCLUDE) -g
CC = gcc
PROGS =	magent

all: $(PROGS)

STPROG = magent.o

magent.o: magent.c
	$(CC) $(CFLAGS) -c -o $@ magent.c

magent: $(STPROG)
	$(CC) -g -o $@ $^ $(LIBS)

clean:
	rm -f *.o *~ $(PROGS) tags
