# zsh_common.sh, commonly used additions/overrides for my zsh/oh-my-zsh instances
ZSH_THEME="gallois"

# Over-engineered git log alias
# short log with 10 entries, format: short-id date-short author-name(12) ⚬ commit-message(50) ref-name
alias gl="git --no-pager log --pretty=format:'%C(red bold)%h%Creset %C(#D4AF37)%ad%Creset %<(15,trunc)%C(#03b3b3)%an%Creset %<(50,mtrunc)%s%C(auto)%d%Creset' --date=short -10"

# format: short-id date-iso-strict author-name \n ref-name commit-message
alias glg="git log --pretty=format:'%n%C(red bold)%h%Creset %C(#D4AF37)%aD%Creset %C(#03b3b3)%an%Creset %n%C(auto)%d%Creset %s'"

# Methods overrides
# zsh ruby prompt
function ruby_prompt_info() { 
    # Display Short ID of git repo
    # Else Display Number of Directories / Files
    dir="$(ll | grep -c '^d')"
    file="$(ll | grep -c '^-')"
    echo "[$([ -d .git ] && git rev-parse --short HEAD || echo "$dir"D "$file"F)]"
}

# export JAVA, Flutter, Android SDK
export JAVA_HOME=/home/deck/devel/tools/amazon-corretto-17.0.5.8.1-linux-x64
export ANDROID_HOME=/home/deck/Android/Sdk
export FLUTTER_HOME=/home/deck/devel/tools/flutter/bin

export PATH=$PATH:$JAVA_HOME
export PATH=$PATH:$FLUTTER_HOME
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools

# Code templates
# Run a command in multiple subdirectories
: <<'EOF'
for d in `ls -d */`
do
    (cd "$d" && `mvn clean install &> "$d.log" &`)
done
EOF

alias gk61='sudo mono /home/saurabh/dev/tools/GK6X/GK6X-v1.12-GUI/GK6X.exe'
alias vi="nvim"


# termux functions
function algo() {
    
    cd ~/storage/shared/dev/AlgoCasts/exercises
    
    # Start Apps
    am start --user 0 -n me.zhanghai.android.files/me.zhanghai.android.files.filelist.FileListActivity
    am start --user 0 -n com.blacksquircle.ui/com.blacksquircle.ui.application.activities.MainActivity
    am start --user 0 -n com.vivaldi.browser/com.google.android.apps.chrome.Main
}

function e() {
    exit
    exit
}

# Raspberry PI related things

# PI colored Prompt, useful with SSH
# use with ZSH_THEME="gallois"
PROMPT='%{$fg[red]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '

function pi() {
    export PI_IP=192.168.0.0
    ssh pi@"$PI_IP"
}

function sn() {
    sudo shutdown now
}