# Linux Practical Test Package — Task Overview

## Objective

The supplied document is a ten-activity Linux practical test intended to cover foundational Linux administration and command-line skills.

## Requirements, in task-sheet order

### Activity 1: Navigation & File Management
1. Create a directory named `linux_lab`.
2. Inside it, create `docs` and `scripts`.
3. Create `readme.txt`, `notes.txt`, and `script.sh`.
4. Write `Welcome to Linux Practice` inside `readme.txt`.
5. Copy `readme.txt` to `docs`.
6. Move `notes.txt` to `docs`.
7. Delete `script.sh`.
8. Display the directory structure with `tree` or `ls -R`.

### Activity 2: File Viewing & Editing
1. Open `readme.txt` with `nano` and add your name at the bottom.
2. Write the function of Kernel, FHS, and Shell under your name.
3. Display the first 3 lines with `head`.
4. Display the last 2 lines with `tail`.
5. Count words with `wc`.
6. Search for `Linux` in `readme.txt` with `grep`.

### Activity 3: Permissions & Ownership
1. Create `secure.txt`.
2. Set owner read/write, group read-only, and no permissions for others.
3. Change permissions to `777`.
4. Create user `student2` (if permitted).
5. Change the owner of `secure.txt` to `student2`.
6. Verify with `ls -l`.

### Activity 4: Archiving & Compression
1. Create `backup_test` and place three text files in it.
2. Create `backup.tar` from that directory.
3. Compress `backup.tar` into `backup.tar.gz`.
4. Extract `backup.tar.gz` into `restore_test`.
5. Verify all files are restored properly.

### Activity 5: Process Management
1. Run `sleep 300 &`.
2. Use `jobs` to display background jobs.
3. Bring the job to the foreground with `fg`.
4. Kill the process using its PID.
5. Use `ps aux | grep sleep` to confirm it is terminated.
6. Use `top` to view running processes.

### Activity 6: Networking Basics
1. Display the IP address with `ip a`.
2. Run `ping google.com -c 4`.
3. Check listening ports with `ss -tulnp`.
4. Find the hostname with `hostname`.
5. Add `127.0.0.1 testsite.local` to `/etc/hosts`.
6. Ping `testsite.local`.

### Activity 7: Searching & Finding
1. Run `find / -name readme.txt 2>/dev/null`.
2. Search all `.txt` files in `docs` for `Linux` using `grep`.
3. Display files modified in the last 24 hours using `find`.
4. Count `.txt` files in the home directory using `find` and `wc -l`.

### Activity 8: Package Management (Debian/Ubuntu-based)
1. Run `sudo apt update`.
2. Install `tree`.
3. Verify with `tree --version`.
4. Remove `tree`.
5. List installed packages and redirect output to `packages.txt`.

### Activity 9: Scripting Basics
1. Create `hello.sh`.
2. Make it display `Hello, Linux World!`.
3. Make it show current date/time with `date`.
4. Make it show the current working directory with `pwd`.
5. Make it executable.
6. Run it.

### Activity 10: System Monitoring & Logs
1. Display disk usage with `df -h`.
2. Check memory with `free -h`.
3. Display the last 10 entries from `/var/log/syslog` or `/var/log/messages`.
4. Show uptime with `uptime`.
5. Show logged-in users with `who`.
6. Display CPU information with `lscpu`.

## Source boundaries and unspecified details

The source names the commands, files, directories, user, and requested actions above. It does **not** specify:
- The student's name or the exact explanatory wording to write for Kernel, FHS, and Shell.
- The names or contents of the three text files inside `backup_test`.
- The exact location of `hello.sh` or `packages.txt`.
- A required screenshot count, screenshot naming scheme, submission format, or submission destination.
- The Linux distribution/version, username of the student, IP address, hostname, PID, or actual command output.

This workflow uses clear, consistent working locations and leaves machine-specific results for the student to produce.
