## 🎯 Simulation Scenarios Completed

### ✅ 1. vsftpd 2.3.4 Backdoor Exploitation
- **Target:** 192.168.1.17 (Ubuntu)
- **Vulnerability:** CVE-2011-2523
- **Result:** Full root access via backdoor port 6200
- **Proof:** Root shell obtained via Metasploit & netcat

### ✅ 2. Nmap Reconnaissance
- Open ports identified: 21 (FTP), 22 (SSH), 80 (HTTP)

### ✅ 3. SSH Bruteforce (Hydra)
- 81 combinations attempted, detection by Wazuh (Rule 5710/5712)

### ✅ 4. SQL Injection (SQLMap)
- Database extracted: dvwa, tables: users, guestbook

### ✅ 5. Command Injection (DVWA)
- Payload: `; whoami`, `; cat /etc/passwd`

### ✅ 6. LFI / Path Traversal (DVWA)
- Payload: `../../etc/passwd`

### ✅ 7. Wazuh & ELK Stack Monitoring
- Custom rules, active response, Sysmon integration
