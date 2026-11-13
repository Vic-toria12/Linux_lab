# Detailed Linux Practical Test Workflow

## Before you begin

Open a terminal and choose a working location where you have write access. The commands below assume you start in that location and create `linux_lab` there. Unless a step says otherwise, run commands as your **normal user**.

Capture genuine evidence as you work if your instructor asks for it. The task sheet itself does not mandate screenshots.

---

## Activity 1 — Navigation & File Management

**Privilege:** Normal user.

### Step 1: Create the workspace and directories

```bash
mkdir -p linux_lab/docs linux_lab/scripts
cd linux_lab
```

- **Purpose:** `mkdir -p` creates the requested main directory and both subdirectories.
- **Expected result:** Your current directory is `linux_lab`; it contains `docs/` and `scripts/`.
- **Verify:** `pwd` and `ls -la`
- **Evidence idea:** Capture the directory listing.

### Step 2: Create the three requested files

```bash
touch readme.txt notes.txt script.sh
```

- **Purpose:** `touch` creates empty files if they do not already exist.
- **Expected result:** All three filenames appear in the current directory.
- **Verify:** `ls -l`
- **Evidence idea:** Capture the listing before the later delete/move operations.

### Step 3: Write the welcome line

```bash
echo "Welcome to Linux Practice" > readme.txt
```

- **Purpose:** `>` writes the exact required text and replaces the file's current contents.
- **Expected result:** `readme.txt` contains the welcome sentence.
- **Verify:** `cat readme.txt`
- **Evidence idea:** Capture the command and displayed line.

### Step 4: Copy, move, and delete

```bash
cp readme.txt docs/
mv notes.txt docs/
rm script.sh
```

- **Purpose:** `cp` copies the readme; `mv` moves notes into `docs`; `rm` deletes the requested `script.sh`.
- **Expected result:** `docs/readme.txt` and `docs/notes.txt` exist; `script.sh` is no longer in the workspace.
- **Verify:** `ls -la` and `ls -la docs`
- **Evidence idea:** Capture both directory listings.
- **Note:** `rm` deletes the file. Confirm the filename before pressing Enter.

### Step 5: Display the directory structure

```bash
tree
```

If `tree` is not installed yet, use the alternative explicitly allowed by the task:

```bash
ls -R
```

- **Expected result:** The structure shows `docs`, `scripts`, and the remaining files.
- **Verify:** Review the output for the copied and moved files.
- **Evidence idea:** Capture the full structure.

---

## Activity 2 — File Viewing & Editing

**Privilege:** Normal user.

### Step 1: Edit `readme.txt` with nano

```bash
nano readme.txt
```

At the bottom of the file, add your own name and the functions of Kernel, FHS, and Shell. Use your course notes or instructor's preferred wording. A concise explanation can be written in your own words:

- `Kernel:` manages communication between software and hardware and allocates system resources.
- `FHS (Filesystem Hierarchy Standard):` defines the standard directory layout and purposes of directories in Linux.
- `Shell:` provides a command-line interface that interprets commands and passes requests to the operating system.

Save in nano with `Ctrl+O`, press `Enter`, then exit with `Ctrl+X`.

- **Expected result:** Your name and the three explanations appear below the original welcome line.
- **Verify:** `cat readme.txt`
- **Evidence idea:** Capture the saved file contents. Do not use another person's name.

### Step 2: Run the requested viewing and search commands

```bash
head -n 3 readme.txt
tail -n 2 readme.txt
wc -w readme.txt
grep "Linux" readme.txt
```

- **Purpose:** `head` shows the first three lines; `tail` shows the last two; `wc -w` counts words; `grep` searches for the literal word `Linux`.
- **Expected result:** The requested portions, word count, and matching line(s) are displayed. The welcome sentence contains `Linux`, so it should match if it remains in the file.
- **Verify:** Compare each result with `cat -n readme.txt`.
- **Evidence idea:** Capture the commands and their actual output.

---

## Activity 3 — Permissions & Ownership

**Privilege:** Normal user for creating/chmod; `sudo` for account creation and ownership change where required and permitted.

### Step 1: Create `secure.txt`

```bash
touch secure.txt
```

- **Expected result:** `secure.txt` exists in `linux_lab`.
- **Verify:** `ls -l secure.txt`

### Step 2: Set owner read/write, group read-only, others no access

```bash
chmod 640 secure.txt
ls -l secure.txt
```

- **Purpose:** `640` means owner `rw-`, group `r--`, others `---`.
- **Expected mode:** `-rw-r-----` (the file-type character at the start may vary only if the object is not a regular file).
- **Verify:** `stat -c '%A %a %n' secure.txt` (GNU/Linux).
- **Evidence idea:** Capture the `chmod` and permission listing.

### Step 3: Change permissions to 777

```bash
chmod 777 secure.txt
ls -l secure.txt
```

- **Purpose:** Gives read, write, and execute permissions to owner, group, and others, as explicitly requested by the exercise.
- **Expected mode:** `-rwxrwxrwx`.
- **Security note:** `777` is intentionally requested as a practical exercise but is generally unsafe for sensitive files. Do not use it on real confidential files.
- **Evidence idea:** Capture the changed mode.

### Step 4: Create `student2` only if permitted

First check whether the account already exists:

```bash
id student2
```

If it does not exist and your instructor/system administrator permits account creation, use:

```bash
sudo useradd student2
```

Some distributions may require an administrator to set a password separately. Do not attempt to bypass account policy. If account creation is not permitted, record that limitation and ask your instructor how to complete the ownership portion.

- **Expected result:** `id student2` displays the account details if the account exists.
- **Verify:** `getent passwd student2`
- **Evidence idea:** Capture the account check, avoiding disclosure of sensitive account data.

### Step 5: Change the owner and verify

Only if `student2` exists and you are authorized:

```bash
sudo chown student2 secure.txt
ls -l secure.txt
```

- **Purpose:** `chown` changes the file owner.
- **Expected result:** The owner column shows `student2`. The group column is not explicitly specified by the task and may remain unchanged.
- **Verify:** `stat -c '%U %G %A %a %n' secure.txt`
- **Evidence idea:** Capture `ls -l` showing the resulting owner and permissions.

---

## Activity 4 — Archiving & Compression

**Privilege:** Normal user.

### Step 1: Create the source directory and three text files

```bash
mkdir -p backup_test
touch backup_test/file1.txt backup_test/file2.txt backup_test/file3.txt
```

The task requires three text files but does not prescribe their names or contents. These neutral filenames satisfy the count; add content if your instructor expects non-empty files.

```bash
printf 'First backup test file\n' > backup_test/file1.txt
printf 'Second backup test file\n' > backup_test/file2.txt
printf 'Third backup test file\n' > backup_test/file3.txt
```

- **Expected result:** Three `.txt` files exist in `backup_test`.
- **Verify:** `ls -l backup_test`
- **Evidence idea:** Capture the three source files.

### Step 2: Create the tar archive

```bash
tar -cvf backup.tar backup_test
```

- **Purpose:** Creates an uncompressed tar archive containing the directory.
- **Expected result:** `backup.tar` appears in the current directory.
- **Verify:** `tar -tvf backup.tar`
- **Evidence idea:** Capture the archive command and listing.

### Step 3: Compress the archive

```bash
gzip backup.tar
```

- **Purpose:** Compresses `backup.tar` and produces `backup.tar.gz`. By default, gzip removes the uncompressed `backup.tar` after successful compression.
- **Expected result:** `backup.tar.gz` exists.
- **Verify:** `ls -lh backup.tar.gz`
- **Evidence idea:** Capture the compressed archive.

### Step 4: Extract into `restore_test`

```bash
mkdir -p restore_test
tar -xvzf backup.tar.gz -C restore_test
```

- **Purpose:** Extracts the gzip-compressed tar archive under `restore_test`.
- **Expected result:** `restore_test/backup_test/` contains the three files.
- **Verify:**
  ```bash
  find restore_test -type f -name '*.txt' -print
  diff -r backup_test restore_test/backup_test
  ```
  `diff -r` should print no differences if the files match.
- **Evidence idea:** Capture the extracted file listing and verification.

---

## Activity 5 — Process Management

**Privilege:** Normal user.

### Step 1: Start the background process and save its PID

```bash
sleep 300 &
SLEEP_PID=$!
echo "$SLEEP_PID"
```

- **Purpose:** Starts the requested 300-second sleep process in the background. `$!` stores the PID of the most recently started background process in the current shell.
- **Expected result:** The shell prints a job notification and a numeric PID.
- **Verify:** `jobs -l` and `ps -p "$SLEEP_PID" -o pid,stat,cmd`
- **Evidence idea:** Capture the job listing and PID. Keep the PID available for the later kill step.

### Step 2: Display jobs

```bash
jobs
```

- **Expected result:** The sleep job appears as a running background job.
- **Verify:** `jobs -l`
- **Evidence idea:** Capture the job listing.

### Step 3: Bring the job to the foreground

```bash
fg %1
```

Use the job number shown by `jobs` if it is not `%1`. The terminal will be occupied by `sleep 300`.

To continue with the required PID-based termination, press **Ctrl+Z** to suspend the foreground job and return to the shell. This is a practical control step; the task sheet does not separately name it.

- **Expected result:** The sleep job becomes the foreground job; after Ctrl+Z it is suspended.
- **Verify:** `jobs -l`
- **Evidence idea:** Capture the foreground/suspended job state if useful.

### Step 4: Kill the process using its PID

```bash
kill "$SLEEP_PID"
```

- **Purpose:** Sends the default termination signal to the process with the saved PID.
- **Expected result:** The process terminates.
- **Verify:** `ps aux | grep sleep`
  The `grep sleep` command may match its own command line. For a clearer check, also run:
  ```bash
  ps -p "$SLEEP_PID" -o pid,stat,cmd
  ```
  No process row for that PID means it is no longer running.
- **Evidence idea:** Capture the kill command and verification.

### Step 5: View running processes

```bash
top
```

- **Purpose:** Opens an interactive live process monitor.
- **Expected result:** A live process list and system summary appear.
- **Exit:** Press `q`.
- **Evidence idea:** Capture the screen if required by your instructor.

---

## Activity 6 — Networking Basics

**Privilege:** Normal user for inspection and ping; `sudo` for modifying `/etc/hosts`.

### Step 1: Display IP configuration

```bash
ip a
```

- **Expected result:** Network interfaces and their addresses are displayed.
- **Verify:** Identify the active interface and its assigned address.
- **Evidence idea:** Capture the relevant output; avoid sharing public IP details if not needed.

### Step 2: Test connectivity

```bash
ping google.com -c 4
```

- **Expected result:** Four ICMP echo requests are attempted; replies indicate connectivity to the destination.
- **Verify:** Review packet transmission/loss summary.
- **Note:** Firewalls, DNS, or network policy may block ping. Record the actual result rather than claiming success.

### Step 3: Check listening ports

```bash
ss -tulnp
```

- **Expected result:** Listening TCP/UDP sockets are listed.
- **Note:** Process details may be hidden for an unprivileged user. If allowed, run `sudo ss -tulnp`.
- **Evidence idea:** Capture the output.

### Step 4: Show hostname

```bash
hostname
```

- **Expected result:** Your system hostname is printed.
- **Evidence idea:** Capture the actual result.

### Step 5: Add the requested hosts mapping

Check whether the line already exists:

```bash
grep -nF '127.0.0.1 testsite.local' /etc/hosts
```

If it is absent, append it with administrator privileges:

```bash
echo '127.0.0.1 testsite.local' | sudo tee -a /etc/hosts
```

- **Purpose:** Adds the local hostname mapping to the system hosts file.
- **Expected result:** The line `127.0.0.1 testsite.local` is present in `/etc/hosts`.
- **Verify:** `getent hosts testsite.local`
- **Safety:** `/etc/hosts` is a system-wide file. Do not overwrite it; the command above appends one line. Avoid duplicate entries.

### Step 6: Ping the test hostname

```bash
ping testsite.local -c 4
```

- **Expected result:** The name resolves to `127.0.0.1`; the local ping is attempted.
- **Verify:** Review the resolved address and packet summary.
- **Evidence idea:** Capture the mapping verification and ping output.

---

## Activity 7 — Searching & Finding

**Privilege:** Normal user; the root-wide search may produce permission messages, which the required redirection suppresses.

### Step 1: Search the filesystem for `readme.txt`

```bash
find / -name readme.txt 2>/dev/null
```

- **Purpose:** Searches from `/` for files named exactly `readme.txt`; redirects standard error to `/dev/null`.
- **Expected result:** Any matching paths are printed, potentially including the lab copy and its `docs` copy.
- **Verify:** Check that the path(s) correspond to actual files.
- **Evidence idea:** Capture the search command and result.

### Step 2: Search `.txt` files in `docs` for `Linux`

Run from inside `linux_lab`:

```bash
grep -nH 'Linux' docs/*.txt
```

- **Purpose:** Searches the `.txt` files directly inside `docs`, showing line numbers and filenames.
- **Expected result:** Matching lines are displayed. `docs/readme.txt` should contain the welcome phrase copied in Activity 1.
- **Note:** If no `.txt` files match the shell pattern, check that Activity 1 was completed correctly.
- **Evidence idea:** Capture the search output.

### Step 3: Find files modified in the last 24 hours

```bash
find . -type f -mmin -1440
```

- **Purpose:** Lists regular files under the current directory modified within the last 1,440 minutes (24 hours).
- **Expected result:** Recently changed files are listed; the exact list depends on when you run the command.
- **Verify:** Check the paths and timestamps with `ls -lt`.
- **Evidence idea:** Capture the output.

### Step 4: Count `.txt` files in the home directory

```bash
find "$HOME" -type f -name '*.txt' | wc -l
```

- **Purpose:** Finds `.txt` files under your home directory and counts the resulting lines.
- **Expected result:** A numeric count is displayed. It depends on the files present in your home directory.
- **Evidence idea:** Capture the command and actual count.

---

## Activity 8 — Package Management (Debian/Ubuntu-based)

**Privilege:** `sudo` for APT package changes; normal user for version check and redirection.

### Step 1: Update the package list

```bash
sudo apt update
```

- **Purpose:** Refreshes APT's local package metadata; it does not upgrade all installed packages.
- **Expected result:** APT reports repository metadata status. Errors may indicate repository or network issues.
- **Evidence idea:** Capture the completion summary.

### Step 2: Install `tree`

```bash
sudo apt install tree
```

Review the package manager's prompt before confirming.

- **Expected result:** APT installs the `tree` package if available.
- **Verify:** `tree --version`
- **Evidence idea:** Capture the version output.

### Step 3: Remove `tree`

```bash
sudo apt remove tree
```

Review the removal summary before confirming. This removes the package but normally leaves configuration files, if any.

- **Expected result:** APT reports the package removal.
- **Verify:** `dpkg -l tree`
- **Evidence idea:** Capture the removal result.

### Step 4: Save the installed-package list

Run from `linux_lab`:

```bash
dpkg -l > packages.txt
```

- **Purpose:** Redirects the installed-package listing into `packages.txt` in the current directory.
- **Expected result:** `packages.txt` is created/overwritten with the package listing.
- **Verify:** `head packages.txt` and `wc -l packages.txt`
- **Evidence idea:** Capture the file and a short preview. The complete package list is machine-specific.

---

## Activity 9 — Scripting Basics

**Privilege:** Normal user.

### Step 1: Create `hello.sh`

The task does not specify a location. For consistency with the workspace, create it inside `linux_lab/scripts/`:

```bash
nano scripts/hello.sh
```

Enter:

```bash
#!/bin/bash
echo "Hello, Linux World!"
date
pwd
```

Save with `Ctrl+O`, `Enter`, and exit with `Ctrl+X`.

Alternatively, the starter file [`../scripts/hello.sh`](../scripts/hello.sh) contains this script and can be copied into `linux_lab/scripts/hello.sh`.

### Step 2: Make it executable and run it

```bash
chmod +x scripts/hello.sh
./scripts/hello.sh
```

- **Purpose:** `chmod +x` adds execute permission; `./` runs the script from the current directory.
- **Expected result:** The greeting, current date/time, and current working directory are displayed.
- **Verify:** `ls -l scripts/hello.sh` and run the script again if needed.
- **Evidence idea:** Capture the script contents and actual run output.

---

## Activity 10 — System Monitoring & Logs

**Privilege:** Normal user for most commands; `sudo` may be required to read system logs.

Run:

```bash
df -h
free -h
```

- **Purpose:** `df -h` displays filesystem disk usage in human-readable units; `free -h` displays memory and swap usage.
- **Expected result:** Filesystem and memory summaries are displayed.
- **Verify:** Review the output headings and values.
- **Evidence idea:** Capture both outputs.

Display the last 10 system log entries. Use the first path if it exists; otherwise use the alternative allowed by the task:

```bash
if [ -f /var/log/syslog ]; then
    sudo tail -n 10 /var/log/syslog
elif [ -f /var/log/messages ]; then
    sudo tail -n 10 /var/log/messages
else
    echo "Neither /var/log/syslog nor /var/log/messages exists on this system."
fi
```

- **Purpose:** Reads the last ten lines from the available system log.
- **Expected result:** Ten log entries are shown if the file exists and access is permitted.
- **Safety/privacy:** Logs can contain usernames, hostnames, IP addresses, and other sensitive operational details. Do not publish them publicly without reviewing/redacting sensitive information.
- **Evidence idea:** Capture only what your instructor needs.

Then run:

```bash
uptime
who
lscpu
```

- **Purpose:** Shows system uptime/load, currently logged-in users, and CPU architecture/details.
- **Expected result:** Each command displays system-specific information.
- **Verify:** Review each command's output.
- **Evidence idea:** Capture the three outputs if requested.

---

## Final verification checklist

- [ ] Activity 1: directory, subdirectories, files, welcome text, copy/move/delete, and structure listing checked.
- [ ] Activity 2: name and Kernel/FHS/Shell functions added; `head`, `tail`, `wc`, and `grep` run.
- [ ] Activity 3: `secure.txt` created; modes `640` and `777` applied; `student2`/ownership handled only if permitted; `ls -l` checked.
- [ ] Activity 4: three text files archived, compressed, extracted, and compared.
- [ ] Activity 5: background job listed, foregrounded, terminated by PID, checked with `ps`, and viewed with `top`.
- [ ] Activity 6: IP, connectivity, ports, hostname, hosts mapping, and local ping checked.
- [ ] Activity 7: all four search/count commands run.
- [ ] Activity 8: APT updated; `tree` installed, version checked, removed; `packages.txt` saved.
- [ ] Activity 9: `hello.sh` contains the required commands, is executable, and has been run.
- [ ] Activity 10: disk, memory, logs, uptime, logged-in users, and CPU information displayed.
- [ ] Actual command history and any instructor-requested evidence saved.
- [ ] Any instructor-specific submission instructions followed.
