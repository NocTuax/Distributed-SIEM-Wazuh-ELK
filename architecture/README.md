# Lab Architecture & Baseline Scan Results

## Network Topology
| Host | Role | IP Address |
|------|------|-------------|
| Kali Linux | Attacker | 192.168.1.29 |
| Target Server | Victim | 192.168.1.24 |
| Wazuh Manager | SIEM | 192.168.1.18 |

## Baseline Reconnaissance (Before Custom Rules)

Folder [before-custom-rules](./before-custom-rules/) berisi hasil scan Nmap **sebelum** custom Suricata rules, active response, dan malware removal diaktifkan.

### Key Findings
- Port terbuka: 21 (vsftpd 2.3.4), 22 (OpenSSH 8.2p1), 80 (Apache 2.4.41)
- Wazuh mendeteksi scan sebagai generic `ET SCAN` (level 3, rule 86601)
- **Belum ada** alert spesifik "Nmap Scripting Engine"
- **Belum ada** active response (IP tidak diblokir)

### Next
Setelah custom rules diaktifkan, scan akan diulang untuk perbandingan.
