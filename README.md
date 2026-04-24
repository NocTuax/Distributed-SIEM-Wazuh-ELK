# Enterprise SOC Lab: Distributed Detection & Response

## 📌 Overview
Proyek ini mensimulasikan lingkungan Security Operations Center (SOC) skala perusahaan. Fokus utama adalah pada integrasi **Wazuh SIEM** dengan **ELK Stack** untuk memantau, mendeteksi, dan merespons ancaman keamanan pada infrastruktur server.

## 🏗️ Lab Architecture
Berbeda dengan setup standar, lab ini menggunakan arsitektur terdistribusi untuk performa dan skalabilitas:

- **Attacker:** Kali Linux (Metasploit, Nmap, Netcat)
- **Victim (JH-Target):** Ubuntu Server (Suricata IDS, Wazuh Agent)
- **Log Shipper:** Filebeat (Mengirim log Suricata ke Elasticsearch)
- **Indexer & Database:** Elasticsearch
- **SIEM Engine:** Wazuh Manager (Rule matching & Decoders)
- **Visualization:** Kibana & Wazuh Dashboard

## 🛡️ Key Features & Configurations
1. **Intrusion Detection:** Integrasi Suricata untuk menangkap Network Artifacts.
2. **Distributed Logging:** Penggunaan Filebeat untuk efisiensi pengiriman log JSON.
3. **Custom Detection Rules:** Penambahan aturan di `local_rules.xml` untuk deteksi spesifik (misal: vsftpd Backdoor CVE-2011-2523).
4. **Threat Intel:** Integrasi VirusTotal API untuk pemindaian file otomatis.

## ☣️ Simulation Scenarios
### 1. vsftpd 2.3.4 Backdoor Exploitation
- **Vulnerability:** CVE-2011-2523
- **Detection Logic:** Mendeteksi signature `:)` pada port 21 dan upaya koneksi ke port 6200.
- **Analysis:** Investigasi kegagalan payload Meterpreter (Died) vs kestabilan Shell via Netcat.

### 2. Reconnaissance Detection
- Mendeteksi scanning agresif dari Nmap (`-sV`, `-O`) melalui korelasi log di Wazuh.

## 📊 Dashboard Documentation
*(Masukkan screenshot Dashboard Kibana kamu di sini)*

## 🧠 Skills Demonstrated
- SIEM/IDS Integration (Wazuh & Suricata)
- Log Management (ELK Stack)
- Linux Server Administration
- Threat Hunting & Incident Analysis
