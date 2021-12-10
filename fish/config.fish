if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set theme_color_scheme gruvbox

# source ~/.asdf/asdf.fish
source /opt/homebrew/opt/asdf/libexec/asdf.fish
source ~/.iterm2_shell_integration.(basename $SHELL)

# https://github.com/fish-shell/fish-shell/issues/7575
# remove this when fish >= 3.2
# if test (uname) = Darwin
# 	function __fish_describe_command; end
# end

# disable ctrl-d shortcut that kills the terminal
bind \cd true

# lab completions
lab completion | source
