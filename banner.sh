#!/data/data/com.termux/files/usr/bin/bash

# ==========================================================
#                         BANNERX
#                    DIVxPAPA EDITION
#                 HACKER TERMINAL ENGINE
# ==========================================================

CONFIG="$HOME/.bannerx_config"

# ==========================================================
# COLORS
# ==========================================================

RESET='\033[0m'

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
PURPLE='\033[35m'
CYAN='\033[36m'
WHITE='\033[37m'

BOLD='\033[1m'
DIM='\033[2m'

# ==========================================================
# DEFAULT SETTINGS
# ==========================================================

TEXT="DIVxPAPA"
FONT="big"
COLOR="$GREEN"
LINK="https://github.com/pytest2x-droid/Bannerx"
STYLE="CYBER"

# ==========================================================
# LOAD CONFIG
# ==========================================================

if [ -f "$CONFIG" ]; then
    source "$CONFIG"
fi

# ==========================================================
# SAVE CONFIG
# ==========================================================

save_config() {
    cat > "$CONFIG" <<EOF
TEXT="$TEXT"
FONT="$FONT"
COLOR="$COLOR"
LINK="$LINK"
STYLE="$STYLE"
EOF
}

# ==========================================================
# HEADER
# ==========================================================

header() {

    clear

    echo
    echo -e "${GREEN}╔══════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GREEN}║                                                      ║${RESET}"
    echo -e "${GREEN}║                 D I V x P A P A                      ║${RESET}"
    echo -e "${GREEN}║                                                      ║${RESET}"
    echo -e "${GREEN}║                 B A N N E R X                       ║${RESET}"
    echo -e "${GREEN}║              H A C K E R   M O D E                  ║${RESET}"
    echo -e "${GREEN}║                                                      ║${RESET}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════╝${RESET}"

    echo
}

# ==========================================================
# CHECK FONT
# ==========================================================

font_exists() {

    if figlet -I2 2>/dev/null | grep -q "$FONT"; then
        return 0
    fi

    if [ -f "/data/data/com.termux/files/usr/share/figlet/fonts/$FONT.flf" ]; then
        return 0
    fi

    return 1
}

# ==========================================================
# SHOW BANNER
# ==========================================================

show_banner() {

    clear

    echo

    case "$STYLE" in

        CYBER)

            echo -e "${COLOR}${BOLD}"
            figlet -f "$FONT" "$TEXT"
            echo -e "${RESET}"

            echo -e "${GREEN}[+] IDENTITY    : ${WHITE}$TEXT${RESET}"
            echo -e "${GREEN}[+] SYSTEM      : ${WHITE}ONLINE${RESET}"
            echo -e "${GREEN}[+] ENGINE      : ${WHITE}BANNERX${RESET}"
            echo -e "${GREEN}[+] SECURITY    : ${WHITE}ACTIVE${RESET}"
            echo -e "${GREEN}[+] STATUS      : ${WHITE}READY${RESET}"
            ;;

        MATRIX)

            echo -e "${GREEN}${BOLD}"
            figlet -f "$FONT" "$TEXT"
            echo -e "${RESET}"

            echo -e "${GREEN}01001001 01001110 01001001 01010100${RESET}"
            echo -e "${GREEN}10101010 11001010 00110011 10101010${RESET}"
            echo -e "${GREEN}01010101 10101010 11001100 01010101${RESET}"

            echo
            echo -e "${GREEN}[ MATRIX ] CONNECTION ESTABLISHED${RESET}"
            ;;

        ROOT)

            echo -e "${RED}${BOLD}"
            figlet -f "$FONT" "$TEXT"
            echo -e "${RESET}"

            echo -e "${RED}[!] ROOT TERMINAL MODE${RESET}"
            echo -e "${RED}[!] PRIVILEGE DISPLAY ONLY${RESET}"
            echo -e "${RED}[!] SYSTEM READY${RESET}"
            ;;

        GHOST)

            echo -e "${WHITE}${BOLD}"
            figlet -f "$FONT" "$TEXT"
            echo -e "${RESET}"

            echo -e "${WHITE}          .-."
            echo -e "${WHITE}         (o o)"
            echo -e "${WHITE}         | O \\"
            echo -e "${WHITE}          \\   \\"
            echo -e "${WHITE}           \`~~~\`${RESET}"

            echo
            echo -e "${WHITE}[ GHOST ] SIGNAL HIDDEN${RESET}"
            ;;

        STEALTH)

            echo -e "${CYAN}${DIM}"
            figlet -f "$FONT" "$TEXT"
            echo -e "${RESET}"

            echo -e "${CYAN}[ STEALTH MODE ]${RESET}"
            echo -e "${CYAN}SIGNATURE : HIDDEN${RESET}"
            echo -e "${CYAN}TRACE     : 0%${RESET}"
            echo -e "${CYAN}STATUS    : INVISIBLE${RESET}"
            ;;

        *)

            echo -e "${COLOR}${BOLD}"
            figlet -f "$FONT" "$TEXT"
            echo -e "${RESET}"

            ;;

    esac

    echo

    echo -e "${COLOR}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

    echo -e "${GREEN}USER      : ${WHITE}$(whoami)${RESET}"
    echo -e "${GREEN}HOST      : ${WHITE}$(hostname)${RESET}"
    echo -e "${GREEN}IDENTITY  : ${WHITE}$TEXT${RESET}"
    echo -e "${GREEN}FONT      : ${WHITE}$FONT${RESET}"
    echo -e "${GREEN}STYLE     : ${WHITE}$STYLE${RESET}"

    if [ -n "$LINK" ]; then
        echo -e "${GREEN}LINK      : ${WHITE}$LINK${RESET}"
    fi

    echo -e "${COLOR}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

    echo
}

# ==========================================================
# IDENTITY MENU
# ==========================================================

identity_menu() {

    header

    echo -e "${GREEN}[01]${RESET} DIVxPAPA"
    echo -e "${GREEN}[02]${RESET} HACKER"
    echo -e "${GREEN}[03]${RESET} CYBER"
    echo -e "${GREEN}[04]${RESET} DARKX"
    echo -e "${GREEN}[05]${RESET} SHADOW"
    echo -e "${GREEN}[06]${RESET} ROOT"
    echo -e "${GREEN}[07]${RESET} GHOST"
    echo -e "${GREEN}[08]${RESET} TERMINAL"
    echo -e "${GREEN}[09]${RESET} CUSTOM"
    echo -e "${GREEN}[00]${RESET} BACK"

    echo

    read -p "DIVxPAPA@IDENTITY > " choice

    case "$choice" in

        01) TEXT="DIVxPAPA" ;;
        02) TEXT="HACKER" ;;
        03) TEXT="CYBER" ;;
        04) TEXT="DARKX" ;;
        05) TEXT="SHADOW" ;;
        06) TEXT="ROOT" ;;
        07) TEXT="GHOST" ;;
        08) TEXT="TERMINAL" ;;

        09)
            echo
            read -p "ENTER IDENTITY > " NEWTEXT

            if [ -n "$NEWTEXT" ]; then
                TEXT="$NEWTEXT"
            fi
            ;;

        00)
            return
            ;;

        *)
            echo -e "${RED}[!] UNKNOWN COMMAND${RESET}"
            sleep 1
            return
            ;;
    esac

    save_config

    echo
    echo -e "${GREEN}[+] IDENTITY UPDATED: $TEXT${RESET}"

    sleep 1
}

# ==========================================================
# HACKER FONT MENU
# ==========================================================

font_menu() {

    header

    echo -e "${GREEN}[01]${RESET} CYBER CORE"
    echo -e "${GREEN}[02]${RESET} DIGITAL"
    echo -e "${GREEN}[03]${RESET} TERMINAL"
    echo -e "${GREEN}[04]${RESET} BLOCK"
    echo -e "${GREEN}[05]${RESET} SHADOW"
    echo -e "${GREEN}[06]${RESET} SCRIPT"
    echo -e "${GREEN}[07]${RESET} MICRO"
    echo -e "${GREEN}[08]${RESET} DOOM"
    echo -e "${GREEN}[09]${RESET} RANDOM"
    echo -e "${GREEN}[00]${RESET} BACK"

    echo

    read -p "DIVxPAPA@FONT > " choice

    case "$choice" in

        01) FONT="big" ;;
        02) FONT="banner" ;;
        03) FONT="block" ;;
        04) FONT="block" ;;
        05) FONT="shadow" ;;
        06) FONT="script" ;;
        07) FONT="small" ;;
        08) FONT="doom" ;;

        09)

            FONTS=(
                big
                banner
                block
                shadow
                script
                small
                doom
            )

            FONT="${FONTS[$((RANDOM % ${#FONTS[@]}))]}"

            ;;

        00)
            return
            ;;

        *)
            echo -e "${RED}[!] UNKNOWN FONT${RESET}"
            sleep 1
            return
            ;;
    esac

    save_config

    echo
    echo -e "${GREEN}[+] FONT CORE UPDATED${RESET}"

    sleep 1
}

# ==========================================================
# COLOR MENU
# ==========================================================

color_menu() {

    header

    echo -e "${RED}[01]${RESET} BLOOD"
    echo -e "${GREEN}[02]${RESET} MATRIX"
    echo -e "${CYAN}[03]${RESET} CYBER"
    echo -e "${PURPLE}[04]${RESET} PURPLE"
    echo -e "${YELLOW}[05]${RESET} GOLD"
    echo -e "${BLUE}[06]${RESET} OCEAN"
    echo -e "${WHITE}[07]${RESET} GHOST"
    echo -e "${GREEN}[00]${RESET} BACK"

    echo

    read -p "DIVxPAPA@COLOR > " choice

    case "$choice" in

        01) COLOR="$RED" ;;
        02) COLOR="$GREEN" ;;
        03) COLOR="$CYAN" ;;
        04) COLOR="$PURPLE" ;;
        05) COLOR="$YELLOW" ;;
        06) COLOR="$BLUE" ;;
        07) COLOR="$WHITE" ;;

        00)
            return
            ;;

        *)
            echo -e "${RED}[!] UNKNOWN COLOR${RESET}"
            sleep 1
            return
            ;;
    esac

    save_config

    echo
    echo -e "${GREEN}[+] COLOR MATRIX UPDATED${RESET}"

    sleep 1
}

# ==========================================================
# STYLE MENU
# ==========================================================

style_menu() {

    header

    echo -e "${GREEN}[01]${RESET} CYBER CORE"
    echo -e "${GREEN}[02]${RESET} MATRIX CODE"
    echo -e "${GREEN}[03]${RESET} ROOT ACCESS"
    echo -e "${GREEN}[04]${RESET} GHOST SIGNAL"
    echo -e "${GREEN}[05]${RESET} STEALTH MODE"
    echo -e "${GREEN}[00]${RESET} BACK"

    echo

    read -p "DIVxPAPA@STYLE > " choice

    case "$choice" in

        01) STYLE="CYBER" ;;
        02) STYLE="MATRIX" ;;
        03) STYLE="ROOT" ;;
        04) STYLE="GHOST" ;;
        05) STYLE="STEALTH" ;;

        00)
            return
            ;;

        *)
            echo -e "${RED}[!] UNKNOWN STYLE${RESET}"
            sleep 1
            return
            ;;
    esac

    save_config

    echo
    echo -e "${GREEN}[+] HACKER STYLE ACTIVATED${RESET}"

    sleep 1
}

# ==========================================================
# LINK MENU
# ==========================================================

link_menu() {

    header

    echo -e "${GREEN}CURRENT LINK:${RESET}"
    echo -e "${WHITE}$LINK${RESET}"

    echo

    read -p "DIVxPAPA@NETWORK > " NEWLINK

    if [ -n "$NEWLINK" ]; then

        LINK="$NEWLINK"

        save_config

        echo
        echo -e "${GREEN}[+] NETWORK LINK UPDATED${RESET}"

        sleep 1
    fi
}

# ==========================================================
# RANDOM HACKER PROFILE
# ==========================================================

random_mode() {

    TEXTS=(
        DIVxPAPA
        HACKER
        CYBER
        DARKX
        SHADOW
        GHOST
        TERMINAL
    )

    FONTS=(
        big
        banner
        block
        shadow
        script
        small
        doom
    )

    STYLES=(
        CYBER
        MATRIX
        ROOT
        GHOST
        STEALTH
    )

    TEXT="${TEXTS[$((RANDOM % ${#TEXTS[@]}))]}"
    FONT="${FONTS[$((RANDOM % ${#FONTS[@]}))]}"
    STYLE="${STYLES[$((RANDOM % ${#STYLES[@]}))]}"

    save_config

    show_banner

    echo
    echo -e "${GREEN}[+] RANDOM PROFILE GENERATED${RESET}"
    echo

    read -p "Press ENTER..."
}

# ==========================================================
# RESET
# ==========================================================

reset_config() {

    TEXT="DIVxPAPA"
    FONT="big"
    COLOR="$GREEN"
    LINK="https://github.com/pytest2x-droid/Bannerx"
    STYLE="CYBER"

    save_config

    echo
    echo -e "${GREEN}[+] DIVxPAPA PROFILE RESTORED${RESET}"

    sleep 1
}

# ==========================================================
# MAIN MENU
# ==========================================================

main_menu() {

    while true; do

        header

        echo -e "${GREEN}┌──────────────────────────────────────────────┐${RESET}"
        echo -e "${GREEN}│              HACKER CONTROL                  │${RESET}"
        echo -e "${GREEN}└──────────────────────────────────────────────┘${RESET}"

        echo

        echo -e "${GREEN}[01]${RESET} 🧬 IDENTITY CORE"
        echo -e "${GREEN}[02]${RESET} 🕶️  HACKER FONT"
        echo -e "${GREEN}[03]${RESET} 🎨 COLOR MATRIX"
        echo -e "${GREEN}[04]${RESET} 💀 HACKER STYLE"
        echo -e "${GREEN}[05]${RESET} 🌐 NETWORK LINK"
        echo -e "${GREEN}[06]${RESET} 👁️  LIVE PREVIEW"
        echo -e "${GREEN}[07]${RESET} 🎲 RANDOM PROFILE"
        echo -e "${GREEN}[08]${RESET} 🔄 RESET PROFILE"
        echo -e "${GREEN}[00]${RESET} ☠️  TERMINATE"

        echo

        echo -e "${DIM}${GREEN}IDENTITY : ${WHITE}$TEXT${RESET}"
        echo -e "${DIM}${GREEN}FONT     : ${WHITE}$FONT${RESET}"
        echo -e "${DIM}${GREEN}STYLE    : ${WHITE}$STYLE${RESET}"

        echo

        read -p "DIVxPAPA@ROOT > " option

        case "$option" in

            01)
                identity_menu
                ;;

            02)
                font_menu
                ;;

            03)
                color_menu
                ;;

            04)
                style_menu
                ;;

            05)
                link_menu
                ;;

            06)
                show_banner
                read -p "Press ENTER..."
                ;;

            07)
                random_mode
                ;;

            08)
                reset_config
                ;;

            00)
                clear
                echo
                echo -e "${GREEN}DIVxPAPA SESSION TERMINATED.${RESET}"
                echo
                exit 0
                ;;

            *)
                echo
                echo -e "${RED}[!] UNKNOWN COMMAND${RESET}"
                sleep 1
                ;;
        esac

    done
}

# ==========================================================
# FIGLET CHECK
# ==========================================================

if ! command -v figlet >/dev/null 2>&1; then

    echo
    echo -e "${RED}[!] FIGLET ENGINE NOT FOUND${RESET}"
    echo
    echo -e "${YELLOW}Install it with:${RESET}"
    echo
    echo "pkg install figlet"
    echo

    exit 1
fi

# ==========================================================
# INITIALIZE
# ==========================================================

save_config

main_menu
