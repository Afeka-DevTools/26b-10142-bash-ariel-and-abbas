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
| `backup_dir.sh` | Backs up the contents of a given directory into a tar.gz file. | Abbas
| `check_internet.sh` | Checks internet connectivity and prints a log to the screen. | Abbas
| `random_password.sh` | Generates a random 10-character password with at least one uppercase, lowercase, digit, and special character. | Abbas
| `delete_old_files.sh` | Deletes files older than X days from a given directory. | Abbas
| `weather.sh` | Fetches and displays the current weather for a given city (via wttr.in). | Abbas

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

### backup_dir.sh
Requires the directory to back up; an optional second argument sets the output directory (defaults to the current directory).
```bash
./scripts/backup_dir.sh <directory_to_backup> [output_directory]
```
Example:
```bash
./scripts/backup_dir.sh ./scripts ./backups
```

### check_internet.sh
No input required.
```bash
./scripts/check_internet.sh
```

### random_password.sh
No input required. Prints a random 10-character password.
```bash
./scripts/random_password.sh
```

### delete_old_files.sh
Requires two arguments: the directory and the age threshold in days.
```bash
./scripts/delete_old_files.sh <directory> <days>
```
Example:
```bash
./scripts/delete_old_files.sh /tmp/old_logs 7
```

### weather.sh
Requires one argument: the city name (multi-word cities are supported).
```bash
./scripts/weather.sh <city>
```
Example:
```bash
./scripts/weather.sh "Tel Aviv"
```
