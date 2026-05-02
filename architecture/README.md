# Lab Architecture & Baseline Scan Results

## Network Topology

| Host | Role | IP Address |
|------|------|-------------|
| Kali Linux | Attacker | `192.168.1.29` |
| Target Server (Ubuntu) | Victim | `192.168.1.17` |
| Wazuh Manager | SIEM | `192.168.1.18` |

---

## Simulation Folders

| Folder | Attack Type | Status |
|--------|-------------|--------|
| `01-reconnaissance-nmap/` | Port Scanning & Service Detection | ✅ Completed |
| `02-hydra-bruteforce/` | SSH Bruteforce Attack | ✅ Completed |
| `03-sqlmap-injection/` | SQL Injection (DVWA) | ✅ Completed |
| `04-command-injection/` | Command Injection (DVWA) | ✅ Completed |
| `05-lfi-path-traversal/` | LFI / Path Traversal (DVWA) | ✅ Completed |
| `06-metasploit-vsftpd/` | vsftpd 2.3.4 Backdoor Exploit | ✅ Completed |
| `07-malware-detection/` | Malware Download & FIM Detection | ✅ Completed |

---

## Tools Used

- **Nmap** - Reconnaissance
- **Hydra** - SSH Bruteforce
- **SQLMap** - SQL Injection
- **Metasploit** - vsftpd Exploit
- **Wazuh SIEM** - Detection & Monitoring
- **Suricata** - IDS (Network Detection)

---

## Summary of Findings

| Attack | Detection by Wazuh | Rule ID | Level |
|--------|-------------------|---------|-------|
| Nmap Scan | ET SCAN Suspicious inbound | 86601 | 3 |
| SSH Bruteforce | sshd: brute force | 5712 | 10 |
| SQL Injection | ET SCAN Sqlmap SQL Injection Scan | 86601 | 3 |
| Command Injection | A web attack returned code 200 | 31106 | 6 |
| LFI / Path Traversal | A web attack returned code 200 | 31106 | 6 |
| vsftpd Backdoor | (Backdoor triggered, no alert) | - | - |
| Malware Download | File added to the system | 554 | - |

---

## MITRE ATT&CK Mapping

| Attack | MITRE Technique |
|--------|-----------------|
| Port Scanning | T1046 (Network Service Scanning) |
| SSH Bruteforce | T1110 (Brute Force) |
| SQL Injection | T1190 (Exploit Public-Facing Application) |
| Command Injection | T1202 (Indirect Command Execution) |
| LFI | T1005 (Data from Local System) |
| vsftpd Exploit | T1190 (Exploit Public-Facing Application) |

---

## Notes

- All simulations were conducted in an isolated lab environment.
- Wazuh SIEM successfully detected most attacks with default rules.
- Custom rules can be added for more specific detection (e.g., Nmap Scripting Engine, Command Injection patterns).
