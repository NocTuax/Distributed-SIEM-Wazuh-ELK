# LFI / Path Traversal Attack - Before Custom Rules

**Date:** May 2, 2026
**Target:** 192.168.1.17 (DVWA - File Inclusion)

## Payload yang Berhasil

http://192.168.1.17/vulnerabilities/fi/?page=../../etc/passwd

## Hasil

- Berhasil membaca file /etc/passwd
- Dapat melihat user system (root, www-data, dll)

## Wazuh Detection

- Rule ID: 31106
- Level: 6
- Description: A web attack returned code 200 (success)

## Suricata Analysis

- Suricata mencatat request HTTP ke /etc/passwd
- Tidak menghasilkan alert karena response tidak match signature
- Ini menunjukkan pentingnya custom rules untuk deteksi LFI

## MITRE ATT&CK

- T1005: Data from Local System
- TA0006: Credential Access
