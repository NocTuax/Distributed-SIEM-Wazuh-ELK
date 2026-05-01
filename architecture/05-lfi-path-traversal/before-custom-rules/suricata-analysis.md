# Suricata Analysis for LFI Attempt

## Command
sudo tail -50 /var/log/suricata/eve.json | grep -i "passwd"

## Result
{"timestamp":"2026-05-01T20:22:18.676461+0000","event_type":"http","src_ip":"192.168.1.2","dest_ip":"192.168.1.17","url":"/vulnerabilities/fi/?page=../../../../../etc/passwd","http_method":"GET","status":200}

## Analysis
- Suricata recorded the HTTP request successfully
- No alert generated (no "alert_signature" field)
- Reason: Response content did not match ET ATTACK_RESPONSE signature

## Conclusion
Default Suricata ruleset did not detect this LFI attempt.
Custom rules are needed for better detection.
