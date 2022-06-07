if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set -x ARCH (arch)

set theme_color_scheme gruvbox

source (brew --prefix asdf)/libexec/asdf.fish

source ~/.asdf/plugins/java/set-java-home.fish

source ~/.iterm2_shell_integration.(basename $SHELL)

# disable ctrl-d shortcut that kills the terminal
bind \cd true

# lab completions
# lab completion | source

starship init fish | source
