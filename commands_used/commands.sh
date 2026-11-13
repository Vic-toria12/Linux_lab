#!/usr/bin/env bash
# Linux Practical Test command reference.
# PURPOSE: print the task commands for manual execution.
# SAFETY: this file intentionally DOES NOT execute the lab commands.
# Run: bash commands/commands.sh

cat <<'COMMAND_REFERENCE'
ACTIVITY 1 — run from the directory where you want linux_lab created
mkdir -p linux_lab/docs linux_lab/scripts
cd linux_lab
touch readme.txt notes.txt script.sh
echo "Welcome to Linux Practice" > readme.txt
cp readme.txt docs/
mv notes.txt docs/
rm script.sh
tree
# If tree is not installed: ls -R

ACTIVITY 2 — normal user; nano is interactive
nano readme.txt
head -n 3 readme.txt
tail -n 2 readme.txt
wc -w readme.txt
grep "Linux" readme.txt

ACTIVITY 3 — normal user, then sudo only where authorized
touch secure.txt
chmod 640 secure.txt
chmod 777 secure.txt
id student2
# Only if student2 does not exist and account creation is permitted:
sudo useradd student2
# Only if student2 exists and ownership change is authorized:
sudo chown student2 secure.txt
ls -l secure.txt

ACTIVITY 4 — normal user
mkdir -p backup_test
touch backup_test/file1.txt backup_test/file2.txt backup_test/file3.txt
tar -cvf backup.tar backup_test
gzip backup.tar
mkdir -p restore_test
tar -xvzf backup.tar.gz -C restore_test
find restore_test -type f -name '*.txt' -print
diff -r backup_test restore_test/backup_test

ACTIVITY 5 — normal user; keep the PID in the same shell
sleep 300 &
SLEEP_PID=$!
jobs
jobs -l
fg %1
# Press Ctrl+Z after the job enters the foreground, then:
kill "$SLEEP_PID"
ps aux | grep sleep
ps -p "$SLEEP_PID" -o pid,stat,cmd
top
# Press q to exit top.

ACTIVITY 6 — normal user except hosts-file edit
ip a
ping google.com -c 4
ss -tulnp
hostname
grep -nF '127.0.0.1 testsite.local' /etc/hosts
# If mapping is absent, append it (requires sudo):
echo '127.0.0.1 testsite.local' | sudo tee -a /etc/hosts
getent hosts testsite.local
ping testsite.local -c 4

ACTIVITY 7 — run inside linux_lab
find / -name readme.txt 2>/dev/null
grep -nH 'Linux' docs/*.txt
find . -type f -mmin -1440
find "$HOME" -type f -name '*.txt' | wc -l

ACTIVITY 8 — Debian/Ubuntu-based system; package operations require sudo
sudo apt update
sudo apt install tree
tree --version
sudo apt remove tree
dpkg -l > packages.txt

ACTIVITY 9 — run inside linux_lab; hello.sh is placed in scripts/
nano scripts/hello.sh
# Script content:
# #!/bin/bash
# echo "Hello, Linux World!"
# date
# pwd
chmod +x scripts/hello.sh
./scripts/hello.sh

ACTIVITY 10 — normal user; sudo may be needed for logs
df -h
free -h
# Use whichever log file exists:
sudo tail -n 10 /var/log/syslog
# or:
sudo tail -n 10 /var/log/messages
uptime
who
lscpu
COMMAND_REFERENCE
