# Linux Practical Test — GitHub-Ready Lab Workflow

A learning-friendly workflow and evidence template for the **10-activity Linux Practical Test Package** supplied with this assignment.

## Objective

Complete the ten activities in the task sheet using Linux commands. The activities cover navigation and file management, viewing and editing, permissions and ownership, archiving, process management, networking, searching, Debian/Ubuntu package management, shell scripting, and system monitoring.

This repository is a guide and starter template. It does **not** claim that any lab command has already been run, and it contains no fabricated output or screenshots.

## Lab requirements from the task sheet

1. **Navigation & File Management:** create `linux_lab`, its `docs` and `scripts` subdirectories, and the named files; write the required welcome text; copy, move, delete, and list as instructed.
2. **File Viewing & Editing:** edit `readme.txt` in `nano`; add your name and the functions of Kernel, FHS, and Shell; use `head`, `tail`, `wc`, and `grep`.
3. **Permissions & Ownership:** create `secure.txt`; set its permissions to `640`, then to `777`; create `student2` if permitted; change ownership; verify with `ls -l`.
4. **Archiving & Compression:** create `backup_test` with three text files; create `backup.tar`, compress it to `backup.tar.gz`, extract into `restore_test`, and verify.
5. **Process Management:** run `sleep 300 &`, inspect jobs, foreground the job, kill it by PID, check termination, and use `top`.
6. **Networking Basics:** inspect IP, test Google connectivity, inspect listening ports, show hostname, add `127.0.0.1 testsite.local` to `/etc/hosts`, and ping the test name.
7. **Searching & Finding:** run the specified `find` search; search `.txt` files in `docs` for `Linux`; find files modified in the last 24 hours; count `.txt` files under the home directory.
8. **Package Management (Debian/Ubuntu-based):** update APT, install and verify `tree`, remove it, and save the installed-package list to `packages.txt`.
9. **Scripting Basics:** create and run executable `hello.sh` that prints the greeting, date/time, and working directory.
10. **System Monitoring & Logs:** display disk, memory, system-log, uptime, logged-in-user, and CPU information.

## Technologies and tools

- Linux shell / terminal
- Core utilities: `mkdir`, `touch`, `cp`, `mv`, `rm`, `cat`, `nano`, `head`, `tail`, `wc`, `grep`, `find`, `tar`, `gzip`, `ps`, `jobs`, `fg`, `kill`, `top`, `ip`, `ping`, `ss`, `hostname`, `df`, `free`, `uptime`, `who`, `lscpu`
- Debian/Ubuntu package manager: `apt` and `dpkg`
- Git and GitHub for version control and hosting (optional for performing the Linux commands)

## Prerequisites and environment

- A Linux environment with a terminal. A Debian/Ubuntu-based system is required for Activity 8.
- A normal user account. `sudo` access is needed for system package operations, editing `/etc/hosts`, and (if permitted) creating a user/changing ownership.
- `nano` is used in Activity 2. If it is not installed, use an available editor only if your instructor permits it; the task specifically names `nano`.
- `tree` may not initially be installed. Activity 1 permits `ls -R` as an alternative; Activity 8 installs `tree`.
- Internet access is needed for `ping google.com -c 4`; DNS or network restrictions may affect the result.
- Some commands or log files may require elevated privileges or may differ between Linux distributions.

## Setup

1. Download and extract this ZIP.
2. Open a terminal in the extracted `linux-practical-test-workflow` directory.
3. Read `docs/task-overview.md` and `workflow/workflow.md`.
4. Perform the activities in order, using the task's exact names and commands.
5. Keep your real command history and evidence in the `evidence/` and `submission/` folders.

The lab working directory created during Activity 1 is `linux_lab` in the location where you run the commands. It is separate from this GitHub project directory.

## Project structure

```text
linux-practical-test-workflow/
├── README.md
├── .gitignore
├── docs/
│   ├── README.md
│   └── task-overview.md
├── workflow/
│   ├── README.md
│   └── workflow.md
├── commands/
│   ├── README.md
│   └── commands.sh
├── scripts/
│   ├── README.md
│   └── hello.sh
├── evidence/
│   ├── README.md
│   ├── screenshots/
│   │   └── .gitkeep
│   └── terminal-output/
│       └── .gitkeep
└── submission/
    ├── README.md
    ├── command-history.txt
    └── final-output.txt
```

## Step-by-step workflow

Follow the detailed procedure in [`workflow/workflow.md`](workflow/workflow.md). The command reference is in [`commands/commands.sh`](commands/commands.sh); it prints the commands as a reference and does not execute the lab.

| Activity | Main outcome |
|---|---|
| 1 | `linux_lab/` with `docs/`, `scripts/`, and the requested file operations completed |
| 2 | Updated `readme.txt` and outputs from `head`, `tail`, `wc`, and `grep` |
| 3 | `secure.txt` permission/ownership changes verified |
| 4 | `backup.tar.gz` and extracted `restore_test/` contents |
| 5 | `sleep 300` process inspected and terminated |
| 6 | Network details checked and `testsite.local` mapped in `/etc/hosts` |
| 7 | File searches and `.txt` count performed |
| 8 | `tree` installed, verified, removed; `packages.txt` created |
| 9 | Executable `hello.sh` created and run |
| 10 | System and log information displayed |

## Commands and privilege levels

- **Normal user:** most file creation, viewing, searching, process, and monitoring commands.
- **`sudo` / administrator:** `apt update`, package installation/removal, writing to `/etc/hosts`, and user administration/ownership changes when required.
- **Specific user:** the task names `student2` as the new owner of `secure.txt`. Create that account only if permitted by your environment/instructor.
- Do not run the entire command reference as one batch. Some steps require interaction (`nano`, `fg`, `top`) or deliberate observation.

## Expected results

Use the expected-result notes in the workflow to check your own work. Examples include the requested directory/file names appearing in `ls -R`, the `secure.txt` mode changing from `640` to `777`, a successful extraction of the three files, and the `hello.sh` script displaying its three required outputs.

Actual IP addresses, hostnames, process IDs, package lists, timestamps, command outputs, and ownership results depend on your machine. Record your own results; do not copy invented sample output.

## Evidence

The task sheet does not explicitly state a screenshot format, required screenshot count, or evidence-submission method. The `evidence/` directory is provided as an optional, organized place to keep genuine screenshots and terminal captures. See [`evidence/README.md`](evidence/README.md).

## Submission

The task sheet lists the ten activities but does not specify a submission platform, file format, or mandatory screenshots. Follow any additional instructions given by your instructor. Use [`submission/README.md`](submission/README.md) to prepare your own command history and final notes without inventing results.

## Troubleshooting and safety

- **Permission denied:** check the current user with `whoami`; use `sudo` only for operations that legitimately require administrator rights and are allowed by your instructor.
- **`tree: command not found`:** use `ls -R` in Activity 1; install `tree` in Activity 8.
- **`ping` fails:** check connectivity and DNS; the failure may be environmental rather than a command syntax issue.
- **`/var/log/syslog` is missing:** check `/var/log/messages`, as the task allows either file.
- **`ss -tulnp` shows incomplete process information:** retry with `sudo ss -tulnp` if permitted.
- **`student2` already exists:** do not create a duplicate; verify the account and proceed only if allowed.
- **`chown` fails:** confirm the account exists and use the required administrator privilege if authorized.
- **`/etc/hosts` already contains the mapping:** avoid adding duplicate entries; verify the existing line and ping `testsite.local`.
- **Process-control confusion:** record the PID immediately after starting `sleep 300 &`. After bringing it to the foreground, press `Ctrl+Z` to suspend it, then kill the recorded PID from the shell.

## Final verification checklist

- [ ] `linux_lab`, `docs`, and `scripts` created.
- [ ] `readme.txt`, `notes.txt`, and `script.sh` created initially; requested copy/move/delete operations completed.
- [ ] `readme.txt` updated with your name and Kernel, FHS, and Shell functions.
- [ ] `head`, `tail`, `wc`, and `grep` checks completed.
- [ ] `secure.txt` set to `640`, then `777`; ownership change to `student2` attempted only if permitted; `ls -l` checked.
- [ ] Three text files archived, compressed, extracted, and verified.
- [ ] Background `sleep 300` job foregrounded and terminated by PID; `ps` and `top` used.
- [ ] Network commands run; `/etc/hosts` mapping checked; `testsite.local` ping attempted.
- [ ] All four searching/finding tasks completed.
- [ ] APT package list updated; `tree` installed, version checked, and removed; `packages.txt` saved.
- [ ] `hello.sh` created, made executable, and run.
- [ ] Disk, memory, logs, uptime, users, and CPU information displayed.
- [ ] Actual evidence and command history saved if requested by the instructor.
- [ ] Instructor-specific submission instructions checked.
