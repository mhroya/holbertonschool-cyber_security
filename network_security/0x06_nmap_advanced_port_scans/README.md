🛡️ Advanced Nmap Scanning & Network Enumeration
This repository contains advanced Nmap techniques, custom scripts, and methodologies used for deep network discovery, firewall evasion, and vulnerability assessment. It is designed for cybersecurity researchers and ethical hackers to understand how different TCP/IP stack manipulations can reveal hidden network details.

🚀 Key Scanning Techniques
The project covers the following advanced scanning categories:

1. Stealth & Evasion (IDS/Firewall Bypass)
Techniques used to bypass stateless firewalls and minimize logging:

TCP ACK Scan (-sA): Used to map out firewall rulesets and determine if a firewall is stateful or stateless.

Xmas Scan (-sX): Sets FIN, PSH, and URG flags to "light up" the packet, bypassing simple filters that only monitor SYN packets.

Idle (Zombie) Scan (-sI): Conducts a completely anonymous scan by bouncing packets off a silent "zombie" host.

Fragmentation (-f): Splits IP packets into tiny fragments to slip past packet inspection systems.

2. Deep Enumeration
Service Version Detection (-sV): Interrogates open ports to determine the exact service name and version number.

OS Fingerprinting (-O): Analyzes TCP/IP responses to guess the underlying operating system.

Aggressive Mode (-A): A combined scan that enables OS detection, version detection, script scanning, and traceroute.

3. Nmap Scripting Engine (NSE)
Usage of specialized scripts for automated vulnerability detection:

auth: Check for weak credentials.

vuln: Scan for known CVEs and system vulnerabilities.

brute: Attempt brute-force attacks against common services.

🛠️ Requirements & Installation
Most advanced scans require Root/Sudo privileges to craft raw network packets.

📝 Usage Examples
Example 1: Mapping Firewall Rules (ACK Scan)

Example 2: Full Stealth Audit (SYN + Version + Scripts)

⚠️ Disclaimer
This project is for educational and ethical testing purposes only. Scanning networks without explicit legal permission is illegal and unethical. The author is not responsible for any misuse of this information.

👤 Author
Röya Məhərrəmli Cybersecurity Researcher | Holberton School  |
