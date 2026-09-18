#!/data/data/com.termux/files/usr/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

source "$SCRIPT_DIR/config.sh"

RESET="\033[0m"

case "$COLOR" in
    red)     C="\033[31m" ;;
    green)   C="\033[32m" ;;
    yellow)  C="\033[33m" ;;
    blue)    C="\033[34m" ;;
    magenta) C="\033[35m" ;;
    cyan)    C="\033[36m" ;;
    white)   C="\033[37m" ;;
    *)        C="\033[31m" ;;
esac

if [ "$CLEAR_SCREEN" = true ]; then
    clear
fi

echo

if command -v figlet >/dev/null 2>&1; then
    if [ -f "$SCRIPT_DIR/fonts/$FONT.txt" ]; then
        echo -e "${C}"
        figlet -f "$SCRIPT_DIR/fonts/$FONT.txt" "$BANNER_TEXT"
        echo -e "${RESET}"
    else
        echo -e "${C}"
        figlet "$BANNER_TEXT"
        echo -e "${RESET}"
    fi
else
    echo -e "${C}=============================="
    echo -e "        $BANNER_TEXT"
    echo -e "==============================${RESET}"
fi

if [ -n "$LINK" ]; then
    echo -e "${C}$LINK${RESET}"
fi

if [ "$SHOW_SEPARATOR" = true ]; then
    echo -e "${C}──────────────────────────────${RESET}"
fi

echo