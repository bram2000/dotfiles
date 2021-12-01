function bat --description 'alias bat=bat --theme=(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo gruvbox-dark || echo gruvbox-light)'
 command bat --theme=(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo gruvbox-dark || echo gruvbox-light) $argv; 
end
