#!/bin/bash

# List of VM private IPs
VM_IPS=("172.18.0.4" "172.24.0.4")  # replace with your actual private IPs

# Optional: port to check (e.g., SSH)
PORT=22

echo "=== Validating Private Connectivity ==="

for ip in "${VM_IPS[@]}"; do
  echo "Checking VM at $ip..."
  
  # Ping test
  if ping -c 2 -W 2 "$ip" &> /dev/null; then
    echo "✅ Ping to $ip successful"
  else
    echo "❌ Ping to $ip failed"
  fi

  # Optional: TCP port check using nc
  if nc -z -w 3 "$ip" $PORT &> /dev/null; then
    echo "✅ Port $PORT on $ip is reachable"
  else
    echo "❌ Port $PORT on $ip is not reachable"
  fi

  echo "-----------------------------------"
done

