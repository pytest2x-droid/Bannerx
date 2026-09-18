#!/data/data/com.termux/files/usr/bin/bash

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo
echo "======================================"
echo "       TERMUX BANNER INSTALLER"
echo "======================================"
echo

echo "[+] Updating packages..."
pkg update -y

echo "[+] Installing required packages..."
pkg install -y figlet

echo
echo "[+] Making scripts executable..."

chmod +x "$REPO_DIR/banner.sh"
chmod +x "$REPO_DIR/uninstall.sh"

# ------------------------------
# Backup shell configuration
# ------------------------------

if [ -f "$HOME/.bashrc" ]; then
    cp "$HOME/.bashrc" "$HOME/.bashrc.termux-banner-backup"
fi

if [ -f "$HOME/.zshrc" ]; then
    cp "$HOME/.zshrc" "$HOME/.zshrc.termux-banner-backup"
fi

# ------------------------------
# Detect shell
# ------------------------------

SHELL_FILE=""

if [ -n "$ZSH_VERSION" ]; then
    SHELL_FILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_FILE="$HOME/.bashrc"
else
    if [ -f "$HOME/.bashrc" ]; then
        SHELL_FILE="$HOME/.bashrc"
    elif [ -f "$HOME/.zshrc" ]; then
        SHELL_FILE="$HOME/.zshrc"
    else
        SHELL_FILE="$HOME/.bashrc"
        touch "$SHELL_FILE"
    fi
fi

MARKER_START="# >>> TERMUX-BANNER >>>"
MARKER_END="# <<< TERMUX-BANNER <<<"

# ------------------------------
# Remove old installation
# ------------------------------

if grep -q "$MARKER_START" "$SHELL_FILE" 2>/dev/null; then

    echo "[+] Removing previous configuration..."

    sed -i "/$MARKER_START/,/$MARKER_END/d" "$SHELL_FILE"

fi

# ------------------------------
# Add banner
# ------------------------------

cat >> "$SHELL_FILE" <<EOF

$MARKER_START
bash "$REPO_DIR/banner.sh"
$MARKER_END
EOF

echo
echo "======================================"
echo "          INSTALLATION DONE"
echo "======================================"
echo
echo "Banner installed successfully."
echo
echo "Configuration:"
echo "$REPO_DIR/config.sh"
echo
echo "Edit it with:"
echo
echo "nano $REPO_DIR/config.sh"
echo
echo "Then restart Termux."
echo