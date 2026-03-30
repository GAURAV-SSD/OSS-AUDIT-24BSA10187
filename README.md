# OSS Capstone Audit — Git (Version Control System)
Git (GPLv2) Capstone Audit for Open Source Software (OSS) in Victoria University of Technology (VUT) Course: Open Source Software Modern Development (OSSD). The audit provides a 14-page report covering the origin story and the license analysis of Git, the Linux footprint of Git and the Free and Open Source Software (FOSS) ecosystem in general, and includes five shell scripts showing practical usage of Linux.

**Student Name:**[HARSHIT]
**Student Roll Number:** 24BAI10967
**Course:** Open Source Software (OSSD), VUT
**Audited Software:** Git - distributed version control system
**Audited Software License:** GPLv2

## What is an Audit?

This repository contains the technical submission for this course’s capstone project, the Open Source Software Audit. The repository contains five shell scripts demonstrating practical command-line skills on a Linux system and collectively show how these practical skills relate to the philosophy and structure of Open Source Software, as defined in units one through five of this course.

The software being audited is **Git**, developed by Linus Torvalds after the free license of the Bit Keeper program had been revoked from the Linux kernel development community (2005). Git has millions of users and is among the most significant components of Open Source Software infrastructure in modern software development, as it is licensed under the GNU General Public License version two (GPLv2).

## Repository File Structure

```
oss-audit-[rollnumber]/
│
├── README.md                  - This file
├── script1_system_identity.sh - Shell Script 1 - System Identity Report
├── script2_package_inspecto... - Shell Script 2 - FOSS Package Inspector
├── script3_disk                       - Shell Script 3...
```

### Script 1 — System Identity Report (`script1_system_identity.sh`)
shows the system with a formatted system welcome message that includes:- the name of the Linux distribution and the kernel that is being used- the user that is currently logged in and their home directory- how long the computer has been running and what the current date and time is- and also what license governs the operating system (Linux kernel is GPL v2).Examples of some of the concepts included in this script are: variables, command substitution $() echo; print; date; uname; whoami; uptime

### Script2 - FOSS Package Inspector(script2_package_inspector.sh) will check for the existence of Git on the system; determine if an RPM or Debian-based package manager is being used; print the version and license information for each of the packages found; and, use the 'case' command to display an explanation of the open-source philosophy for each of the most popular FOSS packages. Many concepts will be used: if-then-else; case statement; command -v; rpm -qi; dpkg -l; pipe |; grep -i

### Script3 - Disk & Permission Auditor(script3_disk_permission_auditor.sh) will loop through some standard Linux directories (/etc; /var/log; /home; /usr/bin; /tmp) as well as through Git directions, reporting their size, allowable permission, owner, and group for each location; and it will will locate the Git binary for you.

The concepts will include: for loop; for each/bash array; if [ -d ]; ls -ld; awk; du-sh; cut

### Script4 - Log File Analyzer(script4_log_analyzer.sh) will accept one or more command line arguments of the path to a logfile and to an optional search term. It will open the log file and read line by line, counting occurrences of the search term (if given), and provide an opportunity to retry to read from the log file

### Script 5 — Open Source Manifesto Generator (`script5_manifesto_generator.sh`)
Interactively asks three questions, generates a personalised open-source philosophy
statement, saves it to a `.txt` file, and displays it.

**Concepts:** `read -p`, input validation with `while [ -z ]`, string concatenation,
`>` and `>>` file output, `date`, `cat`, alias concept (demonstrated via comment)

---

## How to Run Each Script on Linux

### Prerequisites
- A Linux system (Ubuntu, Debian, Fedora, RHEL, Arch, or any mainstream distro)
- Bash shell (default on all Linux systems; verify with `bash --version`)
- Git installed: `sudo apt install git` (Debian/Ubuntu) or `sudo dnf install git` (Fedora/RHEL)

### Step-by-Step Instructions

**1. Clone this repository**
```bash
git clone https://github.com/[your-username]/oss-audit-[rollnumber].git
cd oss-audit-[rollnumber]
```

**2. Make all scripts executable**
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_permission_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

**3. Run Script 1 — System Identity Report**
```bash
./script1_system_identity.sh
```
No arguments required. Displays system identity and OS license information.

**4. Run Script 2 — FOSS Package Inspector**
```bash
./script2_package_inspector.sh
```
No arguments required. Checks for Git installation and prints package details.

**5. Run Script 3 — Disk and Permission Auditor**
```bash
./script3_disk_permission_auditor.sh
```
No arguments required. Audits system directories and Git-specific paths.

**6. Run Script 4 — Log File Analyzer**
```bash
#The command for using the script is:

```bash
./script4_log_analyzer.sh [logfile_path] [keyword]
```

Example 1 - using the default keyword "error":

```bash
./script4_log_analyzer.sh /var/log/syslog
```

Example 2 - using a custom keyword "warning":

```bash
./script4_log_analyzer.sh /var/log/syslog warning
```

Example 3 - on RHEL/CentOS systems, you would use /var/log/messages:

```bash
./script4_log_analyzer.sh /var/log/messages error
```

The first argument must be a valid log file path; the second keyword argument is optional.

Running script 5 generates a public manifesto.

```bash
./script5_manifesto_generator.sh
```

You do not need any command line arguments to run the command - there will be 3 questions asked interactively, and your response will be saved in a file named manifesto_[username].txt in your current directory. 

Dependencies:

| Script | Dependencies |
|-------|-------------|
| 1    | uname, whoami, uptime, date, lsb_release (All Standard) |
| 2    | `rpm` or `dpkg` (Debian) and git |
| 3    | ls, du, awk, cut, and which (All Standard) |
| 4    | grep, tail (All Standard) |
| 5    | date, cat, whoami (All Standard) |

All dependencies are standard utilities included with most versions of Linux, and there is not additional software to install.