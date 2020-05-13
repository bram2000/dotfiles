if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set theme_color_scheme gruvbox

source ~/.asdf/asdf.fish
source ~/.iterm2_shell_integration.(basename $SHELL)
source ~/.asdf/plugins/java/asdf-java-wrapper.fish
# set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
