#!/bin/bash
# =========================================
# Global pretty-style Bash Prompt Installer
# =========================================
# Usage: sudo bash install_pretty.sh

set -e

# -------------------------
# 1. Install Powerline Fonts
# -------------------------
echo "Installing Powerline fonts..."
if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y fonts-powerline
elif command -v yum >/dev/null 2>&1; then
    sudo yum install -y powerline-fonts
else
    echo "Unknown package manager. Please install Powerline fonts manually."
fi

# -------------------------
# 2. Create global prompt
# -------------------------
PROMPT_FILE="/etc/profile.d/pretty.sh"
echo "Creating global pretty-style Bash prompt at $PROMPT_FILE..."

sudo tee "$PROMPT_FILE" > /dev/null <<'EOF'
# pretty-style Bash Prompt (Global, Fixed Colors)
if [[ $- == *i* ]]; then

    # Powerline symbols
    POWERLINE_RIGHT=""
    GIT_BRANCH_SYMBOL=""
    PYTHON_SYMBOL="🐍"
    EXIT_SYMBOL="✘"

    # Colors
    RESET="\[\e[0m\]"
    RED="\[\e[31m\]"
    GREEN="\[\e[32m\]"
    YELLOW="\[\e[33m\]"
    BLUE="\[\e[34m\]"
    MAGENTA="\[\e[35m\]"
    WHITE="\[\e[37m\]"
    BLACK="\[\e[30m\]"

    # Backgrounds
    BG_RED="\[\e[41m\]"
    BG_GREEN="\[\e[42m\]"
    BG_YELLOW="\[\e[43m\]"
    BG_BLUE="\[\e[44m\]"
    BG_MAGENTA="\[\e[45m\]"

    # -----------------------
    # Git branch
    # -----------------------
    parse_git_branch() {
        branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
        if [ -n "$branch" ]; then
            dirty=$(git status --porcelain 2>/dev/null)
            if [ -n "$dirty" ]; then
                echo "$GIT_BRANCH_SYMBOL $branch✗"
            else
                echo "$GIT_BRANCH_SYMBOL $branch✓"
            fi
        fi
    }

    # -----------------------
    # Python virtualenv
    # -----------------------
    parse_python_venv() {
        if [ -n "$VIRTUAL_ENV" ]; then
            echo "$PYTHON_SYMBOL $(basename "$VIRTUAL_ENV")"
        fi
    }

    # -----------------------
    # Build PS1
    # -----------------------
    PS1="\n"

    # User@host
    if [ "$EUID" -eq 0 ]; then
        PS1+="${BG_RED}${WHITE} \u@\h ${POWERLINE_RIGHT}${RESET}"
    else
        PS1+="${BG_BLUE}${WHITE} \u@\h ${POWERLINE_RIGHT}${RESET}"
    fi

    # Current directory
    PS1+="${BG_GREEN}${BLACK} \w ${POWERLINE_RIGHT}${RESET}"

    # Git branch
    GIT_INFO=$(parse_git_branch)
    if [ -n "$GIT_INFO" ]; then
        PS1+="${BG_YELLOW}${BLACK} ${GIT_INFO} ${POWERLINE_RIGHT}${RESET}"
    fi

    # Python virtualenv
    VENV_INFO=$(parse_python_venv)
    if [ -n "$VENV_INFO" ]; then
        PS1+="${BG_MAGENTA}${WHITE} ${VENV_INFO} ${POWERLINE_RIGHT}${RESET}"
    fi

    # Exit status (last command)
    PS1+="\n\$(if [ \$? -ne 0 ]; then echo -e \"\e[31m${EXIT_SYMBOL} \$?\e[0m \"; fi)\$ "
fi
EOF

sudo chmod +x "$PROMPT_FILE"

# -------------------------
# 3. Done
# -------------------------
echo "==============================================="
echo "Global pretty-style Bash prompt installed!"
echo "Make sure all users use a Powerline-patched font"
echo "(Meslo LG M DZ recommended)."
echo "Reload shell to see the prompt: exec bash"
echo "==============================================="
