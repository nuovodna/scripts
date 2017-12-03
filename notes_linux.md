### Quick format USB drive in NTFS file system type

```
sudo mkfs.ntfs -F -Q -L ET32 /dev/sdc
```

### Good PS1 variable

```
export PS1="\[\e[35m\]\@\[\e[0;33m\][\u\[\e[32m\]@\[\e[34;1m\]\h \[\e[31;1m\]\W]\$ \[\e[0m\]"
```
