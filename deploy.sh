#! /bin/bash

sshfs juliusolson.se@ssh.juliusolson.se:/customers/5/5/6/juliusolson.se/httpd.www /mnt/one/ && cp -r build/web/* /mnt/one/rena/ && fusermount -u /mnt/one