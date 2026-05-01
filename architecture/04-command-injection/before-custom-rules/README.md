Task: Command Injection Simulation

Target: http://192.168.1.17/vulnerabilities/exec/

Payload: 192.168.1.17 & ls /home/jadihacker

Hasil:
- Ping berhasil ke 192.168.1.17
- Command "ls /home/jadihacker" berhasil dijalankan
- List file: eicar.com, quickbuck.exe, secret_document.txt, wazuh-agent.deb

Kesimpulan: Web app vulnerable to command injection (CWE-78)

Mitigation:
- Jangan pake system(), exec(), shell_exec()
- Pake whitelist input validation
- Escape special characters
