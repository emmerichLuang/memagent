# Introduction #

magent is a proxy server sitting between memcache clients(such as php programs) and memcached servers. magent have several advantages over direct connections


```
                Client
                  |
                Magent
                  |
    |--|--|-------------------|--|--|
    |  |  |                   |  |  |
  Normal Servers Farm      Backup Servers Farm

```

# Details #

  1. **get gets** command goes to normal servers farm. If one server failed, magent will try read from backup servers farm
  1. If **get gets** command had multi keys, magent will walk every key one by one as above.
  1. **delete incr decr add set replace prepend append cas** command goes to both normal servers farm and backup servers fram at the same time
  1. When client disconnected from magent, magent will keep connections to servers farm instead of close them.
  1. One great advantage of _n_-servers ketama is that only **1/n** portion keys reallocate when one server was added/removed from ketama.

# Suggestions #
  1. run magent on the same server which client runs. client connects to 127.0.0.1, which is faster