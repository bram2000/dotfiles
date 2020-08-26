function toggle_dark_mode
dark-mode toggle
set dark_mode (dark-mode status)
if test "$dark_mode" = "on"
it2profile Default
set -gx BAT_THEME "gruvbox-dark"
else
it2profile Light
set -gx BAT_THEME "gruvbox-light"
end
end
