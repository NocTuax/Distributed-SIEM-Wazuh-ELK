# 🔐 SSH Bruteforce Simulation (Hydra) - Before Custom Rules

## 📅 Date
April 26, 2026

## 🖥️ Lab Environment

| Host | Role | IP Address |
|------|------|------------|
| Kali Linux | Attacker | `192.168.1.29` |
| Target Server | Victim | `192.168.1.24` |
| Wazuh Manager | SIEM | `192.168.1.18` |

---

# ⚔️ Attack Execution

## Command
```bash
hydra -L wordlist.txt -P wordlist.txt 192.168.1.24 ssh -V
```

## Result

| Parameter | Value |
|-----------|-------|
| Total attempts | 81 combinations |
| Successful logins | 0 |
| Duration | ~23 seconds |

---

# 🛡️ Wazuh Detection

## Alerts Triggered

| Rule ID | Level | Description |
|---------|-------|-------------|
| 5763 | 10 | sshd: brute force trying to get access to the system |
| 5760 | 5 | sshd: authentication failed |
| 5710 | 5 | sshd: Attempt to login using a non-existent user |
| 5503 | 5 | SSH: User login failed |

## MITRE ATT&CK Mapping

- **T1110** - Brute Force  
- **T1110.001** - Password Guessing  
- **T1021.004** - Remote Services: SSH  

---

# 📊 Key Findings

| Aspect | Status |
|--------|--------|
| Attack executed | ✅ Yes |
| Wazuh detected | ✅ Yes |
| Highest alert level | 10 (Critical) |
| Active response | ❌ Not enabled (IP not blocked) |
| Custom rule | ❌ Not enabled |

---

# 📸 Screenshots

| File | Description |
|------|-------------|
| `hydra-terminal.png` | Hydra execution in Kali terminal |
| `hydra-results.png` | Hydra final result (0 valid password) |
| `wazuh-alerts-table.png` | Wazuh alerts table showing brute force detection |
| `wazuh-alerts-filtered.png` | Alerts filtered by source IP `192.168.1.29` |

---

# 🎯 Observations

## Before Custom Rules (Current State)

- Wazuh successfully detects the brute force pattern  
- Alert level **10** indicates high severity  
- No automatic response — attacker IP is not blocked  
- Detection relies on default Wazuh rules  

## What Will Change After Custom Rules

- Custom Suricata rule for specific attack detection  
- Active Response: Auto-block attacker IP for 60 seconds  
- Malware Remove: Auto-delete detected malicious files  

---

# 📁 Files in This Directory

```text
02-hydra-bruteforce/
├── README.md
├── hydra-command.sh
├── hydra-results.txt
├── wazuh-alert-summary.txt
├── hydra-terminal.png
├── hydra-results.png
├── wazuh-alerts-table.png
└── wazuh-alerts-filtered.png
```

---

# 🔗 Related

- [Nmap Reconnaissance](../01-nmap-recon/)
- SQLMap Injection *(Coming Soon)*

---

# 🧠 Detection Summary

| Category | Value |
|----------|-------|
| Attack Type | SSH Bruteforce |
| Tool Used | Hydra |
| Detection Source | Wazuh Default Rules |
| MITRE Technique | T1110.001 |
| Severity | Critical |
| Prevention Enabled | No |

---

## ✅ Conclusion

This simulation confirmed that default Wazuh rules can detect SSH brute-force activity and generate high-severity alerts. However, without custom rules and active response enabled, detection is passive only and does not prevent continued attacker activity.

Next phase will implement:

- Custom Suricata detection rules  
- Automated IP blocking  
- Active malware response actions
