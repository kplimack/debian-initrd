# initrd.gz Generator for Debian Preseed

In order to work with basejump, a few modifications need to be made to Debian's netboot initrd.gz. The Makefile takes care of generating everything correctly.

## Building:

```bash
sudo make
```

This will generate the initrd.ihr.gz. Use as normal.
