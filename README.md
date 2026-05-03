# Distributed SIEM Lab: Wazuh + ELK Stack

## 🎯 Overview

Proyek ini adalah implementasi infrastruktur **Security Operations Center (SOC)** terdistribusi menggunakan **Wazuh SIEM** dan **ELK Stack** (Elasticsearch, Logstash, Kibana) untuk deteksi ancaman real-time dan analisis log IDS (Suricata).

## 🏗️ Lab Architecture

| Host | Role | IP Address |
|------|------|-------------|
| Kali Linux | Attacker | 192.168.1.29 |
| Target Server (Ubuntu) | Victim | 192.168.1.17 |
| Wazuh Manager | SIEM | 192.168.1.18 |

## ✅ Simulations Completed

| No | Attack Type | Tool | Status |
|----|-------------|------|--------|
| 1 | Port Scanning & Service Detection | Nmap | ✅ |
| 2 | SSH Bruteforce | Hydra | ✅ |
| 3 | SQL Injection | SQLMap | ✅ |
| 4 | Command Injection | Manual Payload | ✅ |
| 5 | LFI / Path Traversal | Manual Payload | ✅ |
| 6 | vsftpd 2.3.4 Backdoor Exploit | Metasploit + Netcat | ✅ |
| 7 | Malware Detection (FIM) | Wazuh + VirusTotal | ✅ |

## 📚 TryHackMe Labs Completed

1. **Windows Threat Detection 1** - RDP Breach, Phishing, USB Malware, Sysmon Analysis
2. **ELK Analyst (Servidae Log Analysis)** - Kibana, KQL, MITRE ATT&CK Mapping

## 🔍 Key Findings

- Wazuh berhasil mendeteksi sebagian besar serangan dengan default rules
- Attacker menggunakan `curl.exe` untuk C2 communication ke `evilparrot.thm`
- Persistence dilakukan via registry Run key (`BackdoorShell`) dan user creation (`backdoor`)
- Lateral movement menggunakan credential reuse (`Password123!`)

## 🧠 MITRE ATT&CK Techniques Identified

| Technique | ATT&CK ID |
|-----------|-----------|
| Exploit Public-Facing Application | T1190 |
| Phishing | T1566 |
| Brute Force | T1110 |
| Command Injection | T1202 |
| Data from Local System | T1005 |
| Registry Run Keys | T1547.001 |
| Create Account | T1136 |

## 📁 Project Structure

```
Distributed-SIEM-Wazuh-ELK/
├── architecture/                          # Hasil scan & simulasi
│   ├── 01-reconnaissance-nmap/
│   ├── 02-hydra-bruteforce/
│   ├── 03-sqlmap-injection/
│   ├── 04-command-injection/
│   ├── 05-lfi-path-traversal/
│   ├── 06-metasploit-vsftpd/
│   └── 07-malware-detection/
├── configs/                               # File konfigurasi
│   └── wazuh/
│       ├── ossec_agent.conf
│       ├── ossec_manager.conf
│       ├── local_rules.xml
│       ├── local_decoder.xml
│       └── sysmon_config.xml
├── dashboards/                            # Export dashboard Kibana
└── reports/                               # Laporan PDF
    ├── Windows_Threat_Detection_1_Report.pdf
    └── ELK_Analyst_Report.pdf
```


## 🛠️ Tools Used

- **SIEM:** Wazuh, ELK Stack (Elasticsearch, Logstash, Kibana)
- **IDS:** Suricata
- **Endpoint Monitoring:** Sysmon, auditd
- **Attack Tools:** Nmap, Hydra, SQLMap, Metasploit, Netcat

## 📊 Detection Rules

- Custom Wazuh rules untuk Nmap Scripting Engine (Rule ID 100200)
- Custom Wazuh rules untuk Command Injection (Rule ID 100250)
- Active Response: Auto-block IP attacker via firewall-drop
- Malware Removal: Auto-delete malicious files via VirusTotal integration

## ⚠️ Disclaimer

> Semua simulasi dilakukan di lingkungan **lab terisolasi (VirtualBox)** dengan izin. Jangan dijalankan ke sistem produksi tanpa otorisasi. Materi ini untuk tujuan pendidikan.

## 📅 Timeline

- Lab setup & installation: April 2026
- Simulations (Before Custom Rules): April 26 - May 2, 2026
- TryHackMe Labs: May 1 - May 4, 2026
- Documentation & GitHub upload: May 4, 2026

## 👨‍💻 Author

**Muhamad Yusril Malakaini**  
SOC Analyst (in training)

---

🔗 **GitHub:** [NocTuax/Distributed-SIEM-Wazuh-ELK](https://github.com/NocTuax/Distributed-SIEM-Wazuh-ELK)
