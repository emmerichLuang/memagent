LIBS = -levent -lm
CFLAGS = -Wall -O2 -g
CC = gcc
PROGS =	magent

all: $(PROGS)

STPROG = magent.o ketama.o

ketama.o: ketama.c ketama.h
	$(CC) $(CFLAGS) $(INCLUDE) -c -o $@ ketama.c

magent.o: magent.c ketama.h
	$(CC) $(CFLAGS) $(INCLUDE) -c -o $@ magent.c

magent: $(STPROG)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

clean:
	rm -f *.o *~ $(PROGS) tags
