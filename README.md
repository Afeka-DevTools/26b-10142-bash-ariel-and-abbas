# Bash Scripting Assignment

## Team Members
- Ariel Yitzhaki
- Mohammad Abbas

## Scripts

All scripts are located in the `scripts/` folder.

| Script | Description | Created By
| --- | --- |
| `uptime.sh` | Displays how long the system has been running. | Ariel
| `disk_usage.sh` | Shows disk usage of each subdirectory in a given directory. | Ariel
| `env_vars.sh` | Prints important environment variables. | Ariel
| `sort_lines.sh` | Sorts the lines of a given file alphabetically. | Ariel
| `user_info.sh` | Shows info about the current user: name, home, groups, and shell. | Ariel

## Setup

Clone the repository and enter it:

```bash
git clone <your repository address>
cd 26b-10142-bash-ariel-and-abbas
```

Give the scripts execute permission:

```bash
chmod +x scripts/*.sh
```

## How to Run Each Script

### uptime.sh
No input required.
```bash
./scripts/uptime.sh
```

### disk_usage.sh
Optional argument: the directory to scan (defaults to the current directory).
```bash
./scripts/disk_usage.sh           # scans current directory
./scripts/disk_usage.sh /home     # scans a specific directory
```

### env_vars.sh
No input required.
```bash
./scripts/env_vars.sh
```

### sort_lines.sh
Requires one argument: the file whose lines you want sorted.
```bash
./scripts/sort_lines.sh <file>
```
Example:
```bash
printf "banana\napple\ncherry\ndate\n" > test.txt
./scripts/sort_lines.sh test.txt
```

### user_info.sh
No input required.
```bash
./scripts/user_info.sh
```
