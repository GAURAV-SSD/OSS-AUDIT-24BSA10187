# OSS Audit — Git
### oss-audit-24BSA10187

**Student Name:** Gaurav Bhardwaj
**Registration Number:** 24BSA10187
**Course:** Open Source Software (NGMC)
**Chosen Software:** Git (GPL v2)

---

## About This Project

This repository is a structured audit of **Git**, the open-source distributed version control system created by Linus Torvalds in 2005. The audit covers Git's origin story, its GPL v2 license, its Linux footprint, its place in the FOSS ecosystem, and a comparison with proprietary alternatives.

Alongside the written report, five shell scripts demonstrate practical Linux/Unix command-line skills and the philosophy of open-source automation.

---

## Repository Structure

```
oss-audit-24BSA10187/
├── README.md                        ← This file
├── script1_system_identity.sh       ← System welcome screen with OS and kernel info
├── script2_package_inspector.sh     ← Checks if Git is installed, shows version + philosophy
├── script3_disk_auditor.sh          ← Audits key system directories for size and permissions
├── script4_log_analyzer.sh          ← Reads a log file and counts keyword occurrences
├── script5_manifesto_generator.sh   ← Interactive open source philosophy statement generator
```

---

## Scripts — Description

### Script 1 — System Identity Report
Displays a formatted welcome screen showing the OS name, kernel version, logged-in user, home directory, system uptime, current date/time, and a note about the GPL v2 license that covers the Linux kernel.

**Concepts used:** variables, `echo`, command substitution `$()`, basic output formatting.

---

### Script 2 — FOSS Package Inspector
Checks whether Git is installed on the system using the available package manager (`brew` on macOS, `rpm` on RedHat/Fedora, `dpkg` on Debian/Ubuntu). Displays the installed version and uses a `case` statement to print a philosophy note about the chosen package.

**Concepts used:** `if-then-else`, `case` statement, package manager commands, `grep`, pipe `|`.

---

### Script 3 — Disk and Permission Auditor
Loops through a list of important system directories (`/etc`, `/var/log`, `/tmp`, `/usr/bin`, `/usr/local`) and reports the size and permissions of each. Also checks Git's config file location and prints its permissions.

**Concepts used:** `for` loop, `ls -ld`, `du -sh`, `awk`, `cut`, array iteration.

---

### Script 4 — Log File Analyzer
Accepts a log file path and an optional keyword as command-line arguments. Reads the file line by line using a `while read` loop, counts how many lines contain the keyword, and prints the last 5 matching lines. Includes a built-in demo mode with a sample log if no file is provided.

**Concepts used:** `while read` loop, `if-then`, counter variables, command-line arguments `$1`/`$2`, `grep`, `tail`, `wc`.

---

### Script 5 — Open Source Manifesto Generator
Interactively asks the user three questions, then composes a personalised open-source philosophy paragraph using their answers. Saves the output to a `.txt` file named after the current user and displays it on screen.

**Concepts used:** `read` for user input, string concatenation, file writing with `>` and `>>`, `date` command, alias concept (demonstrated via comment).

---

## How to Run

### Step 1 — Clone the repository
```bash
git clone https://github.com/YOUR_USERNAME/oss-audit-24BSA10187.git
cd oss-audit-24BSA10187
```

### Step 2 — Make all scripts executable
```bash
chmod +x script1_system_identity.sh \
         script2_package_inspector.sh \
         script3_disk_auditor.sh \
         script4_log_analyzer.sh \
         script5_manifesto_generator.sh
```

### Step 3 — Run each script

```bash
# Script 1 — System Identity Report
./script1_system_identity.sh

# Script 2 — FOSS Package Inspector
./script2_package_inspector.sh

# Script 3 — Disk and Permission Auditor
./script3_disk_auditor.sh

# Script 4 — Log File Analyzer (demo mode — no arguments needed)
./script4_log_analyzer.sh

# Script 4 — with a real log file and custom keyword
./script4_log_analyzer.sh /var/log/system.log error

# Script 5 — Manifesto Generator (interactive)
./script5_manifesto_generator.sh
```

---

## Dependencies

| Tool | Purpose | macOS | Linux |
|------|---------|-------|-------|
| `bash` | Shell interpreter | Pre-installed | Pre-installed |
| `git` | Software being audited | `brew install git` or Xcode CLI tools | `apt install git` / `dnf install git` |
| `brew` | Package manager (macOS only) | [brew.sh](https://brew.sh) | Not applicable |
| `uname`, `whoami`, `du`, `ls` | Standard Unix utilities | Pre-installed | Pre-installed |
| `grep`, `awk`, `cut`, `tail` | Text processing | Pre-installed | Pre-installed |

> **Note:** Script 2 auto-detects your package manager. On macOS it uses `brew`; on Linux it uses `rpm` (Fedora/RHEL) or `dpkg` (Debian/Ubuntu). No manual configuration needed.

---

## Platform Compatibility

| Script | macOS | Linux (Debian/Ubuntu) | Linux (Fedora/RHEL) |
|--------|-------|-----------------------|----------------------|
| Script 1 | ✅ | ✅ | ✅ |
| Script 2 | ✅ (brew) | ✅ (dpkg) | ✅ (rpm) |
| Script 3 | ✅ | ✅ | ✅ |
| Script 4 | ✅ | ✅ | ✅ |
| Script 5 | ✅ | ✅ | ✅ |

---

## Academic Integrity

All shell scripts and report content are the original work of Gaurav Bhardwaj (24BSA10187). Scripts may be verified by running them and explaining their logic in a viva.

---

*Course: Open Source Software | VIT | Submission: oss-audit-24BSA10187*
