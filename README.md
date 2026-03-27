# The Open Source Audit: Mozilla Firefox

This repository contains a suite of 5 Bash shell scripts designed to audit a Linux system with a focus on **Mozilla Firefox**. These scripts were developed for an Open Source Software university capstone project.

**Author:** Prageya Dubey  
**Course:** Open Source Software  
**Topic of Audit:** Mozilla Firefox (package: `firefox`)

---

## 🚀 Getting Started

Follow these instructions to set up and run the audit scripts on your Ubuntu/Debian system.

### 1. Make the scripts executable
Before running the scripts, you must grant execution permissions using the `chmod` command.

```bash
chmod +x 01_sys_identity.sh 02_pkg_inspector.sh 03_dir_audit.sh 04_log_analyzer.sh 05_manifesto_gen.sh
```

### 2. Run the scripts
Each script can be executed directly from the terminal.

#### Script 1: System Identity Report
Displays the host OS details, kernel version, and Firefox license information.
```bash
./01_sys_identity.sh
```

#### Script 2: FOSS Package Inspector
Checks if Firefox is installed and provides philosophical notes on open-source networking tools.
```bash
./02_pkg_inspector.sh
```

#### Script 3: Disk and Permission Auditor
Loops through critical Firefox directories to check permissions and disk usage.
```bash
./03_dir_audit.sh
```

#### Script 4: Log File Analyzer
Analyzes log files for security errors (`SEC_ERROR`). It can take a custom file path and keyword as arguments.
```bash
# To run with dummy log generation:
./04_log_analyzer.sh

# To run on a specific file search for a specific keyword:
./04_log_analyzer.sh /var/log/syslog "error"
```

#### Script 5: Open Source Manifesto Generator
An interactive script that asks for your vision of the web and generates a personalized manifesto.
```bash
./05_manifesto_gen.sh
```

---

## 📂 Project Structure

- `01_sys_identity.sh`: Variable usage and command substitution.
- `02_pkg_inspector.sh`: Conditionals and case statements for package status.
- `03_dir_audit.sh`: Loops and filesystem inspection tools (`du`, `ls`).
- `04_log_analyzer.sh`: While loops and file stream processing.
- `05_manifesto_gen.sh`: Interactive user input and file redirection.

## ⚖️ License
This project follows the **MPL 2.0** (Mozilla Public License) for the audit subject and **GPL** for the OS environment scripts.
