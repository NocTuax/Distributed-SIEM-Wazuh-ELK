# Network Architecture & Data Flow

Lab ini mensimulasikan lingkungan SOC Enterprise dengan pemisahan peran antar node untuk skalabilitas dan manajemen log yang efisien.

### 🌐 Topology Details
- **Attacker Node:** Kali Linux (Eth0: 192.168.1.29)
- **Security Monitoring (SIEM):** Wazuh Manager & ELK Stack (Ubuntu Server: 192.168.1.18)
- **Victim/Sensor Node:** JH-Target (Ubuntu Server: 192.168.1.24)

### 🔄 Data Pipeline Flow
1. **Event Generation:** JH-Target mendeteksi aktivitas (syslog/Suricata logs).
2. **Log Collection:** Filebeat membaca `eve.json` milik Suricata secara real-time.
3. **Log Ingestion:** Log dikirim ke Elasticsearch untuk di-indexing.
4. **Security Analysis:** Wazuh Manager melakukan cross-check dengan `local_rules.xml`.
5. **Visualization:** Hasil deteksi ditampilkan di Kibana Dashboard.
