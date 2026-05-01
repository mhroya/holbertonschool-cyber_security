#READmE
This repository contains Bash scripts covering Linux security, SELinux, SUID/SGID, firewall, and basic server hardening tasks. Each script has a clear purpose for practicing real-world security administration.

0. Add a New User

Script: 0-add_user.sh
Purpose: Creates a new Linux user and sets a password.
Usage:

sudo ./0-add_user.sh username password

1. Add a New Group

Script: 1-add_group.sh
Purpose: Adds a new group, changes file ownership to the group, and sets group permissions (read & execute).
Usage:

sudo ./1-add_group.sh group_name file_name

2. Allow User to Run Sudo Without Password

Script: 2-sudo_nopass.sh
Purpose: Grants a user the ability to run sudo commands without entering a password.
Usage:

sudo ./2-sudo_nopass.sh username

3. Find SUID/SGID Files

Script: 3-find_files.sh
Purpose: Lists all files modified in the last 24 hours with SUID or SGID set.
Usage:

sudo ./3-find_files.sh /target/directory

4. Find SUID Files

Script: 4-find_suid.sh
Purpose: Lists all files with SUID bit set in a given directory.
Usage:

./4-find_suid.sh /target/directory

5. Add SELinux Login Mapping

Script: 5-add_selinux.sh
Purpose: Adds a new SELinux login mapping for a Linux user to user_u.
Usage:

sudo ./5-add_selinux.sh username

6. Check SELinux Port

Script: 3-add_port.sh
Purpose: Adds a new SELinux TCP port http_port_t (port 81) for HTTP traffic.
Usage:

sudo ./3-add_port.sh

7. Simulate DoS Attack

Script: 7-dos.sh
Purpose: Sends random TCP flood packets to a target HTTP server using hping3.
Usage:

sudo ./7-dos.sh target_ip


⚠️ Warning: Only use in a lab environment.

8. Check Weak SSL/TLS Ciphers

Script: 8-cipher.sh
Purpose: Uses nmap to check for weak SSL/TLS ciphers on port 443.
Usage:

sudo ./8-cipher.sh target_ip

9. Implement Basic Firewall Rules

Script: 9-firewall.sh
Purpose: Creates basic iptables rules:

Allow SSH

Allow established connections

Block all other incoming traffic
Usage:

sudo ./9-firewall.sh

Notes

Run scripts with sudo if they modify system settings.

These scripts are for educational purposes in a safe lab environment.

SELinux tasks require policycoreutils-python-utils for semanage.

💡 Recommended Setup
sudo apt update
sudo apt install hping3 nmap snmp lynis policycoreutils-python-utils -y
