#!/bin/bash

# stuff is currently mounted ?       ||   no? ...mount it!
ps aux | grep sshfs | grep -iq rhino || /opt/local/bin/sshfs kessler@10.0.20.120:/home/kessler/ ~/rhino -o volname=RHINO -o local
#ps aux | grep sshfs | grep -iq atoz || /opt/local/bin/sshfs kessler@atoz:/bigvol/home/kessler/ ~/atoz -o volname=ATOZ -o local
/opt/local/bin/sshfs kessler@10.0.20.120:/mnt/ ~/mnt -o volname=MNT -o local

## x11 running     || run it!
#pgrep -iq xquartz || /opt/x11/bin/xterm -e 'echo x11 opened; sleep .5'
#wait

