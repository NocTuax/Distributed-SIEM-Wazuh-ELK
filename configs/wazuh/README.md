# Configuration Files

This directory contains configuration files used in the SOC lab environment.

## Wazuh Configurations
- `wazuh/ossec_manager.conf` - Wazuh manager configuration
- `wazuh/ossec_agent.conf` - Wazuh agent configuration on target server
- `wazuh/local_rules.xml` - Custom detection rules
- `wazuh/local_decoder.xml` - Custom log decoders for Suricata

## Suricata Configurations
- `suricata/suricata.yaml` - Suricata IDS configuration
- `suricata/custom_rules.txt` - Custom Suricata detection rules

## Sysmon Configuration
- `sysmon/sysmon_config.xml` - Sysmon configuration for Windows event logging

## Deployment Notes
- Wazuh manager: `192.168.1.18`
- Wazuh agent target: `192.168.1.17`
- Suricata running on target server
