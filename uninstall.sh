#!/data/data/com.termux/files/usr/bin/bash

MARKER_START="# >>> TERMUX-BANNER >>>"
MARKER_END="# <<< TERMUX-BANNER <<<"

echo
echo "======================================"
echo "       TERMUX BANNER UNINSTALLER"
echo "======================================"
echo

remove_banner() {

    FILE="$1"

    if [ -f "$FILE" ]; then

        if grep -q "$MARKER_START" "$FILE" 2>/dev/null; then

            sed -i "/$MARKER_START/,/$MARKER_END/d" "$FILE"

            echo "[+] Removed banner from $FILE"

        else

            echo "[!] No banner found in $FILE"

        fi

    fi
}

remove_banner "$HOME/.bashrc"
remove_banner "$HOME/.zshrc"

echo
echo "Banner configuration removed."
echo
echo "Restart Termux to apply changes."
echo