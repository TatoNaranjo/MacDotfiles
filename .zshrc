source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

compile() {
    g++-14 -std=c++20 "$1"
}
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"


PATH=~/.console-ninja/.bin:$PATH


alias updateNotes="cd LasNotasDeTato-Quartz/content/ && git pull && cd .. && npx quartz sync --no-pull"

echo "alias config='/usr/bin/git --git-dir=/Users/tatonaranjo/.cfg/ --work-tree=/Users/tatonaranjo'" >> ~/.zshrc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tatonaranjo/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tatonaranjo/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/tatonaranjo/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tatonaranjo/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> Added by Spyder >>>
alias uninstall-spyder=/Users/tatonaranjo/Library/spyder-6/uninstall-spyder.sh
# <<< Added by Spyder <<<

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/tatonaranjo/.lmstudio/bin"

# Created by `pipx` on 2025-07-20 22:19:18
export PATH="$PATH:/Users/tatonaranjo/.local/bin"
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
