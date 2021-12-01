function cjsm-otp --wraps='oathtool --base32 --totp (gpg -qd ~/.secrets/cjsm-mfa) | pbcopy' --description 'alias cjsm-otp oathtool --base32 --totp (gpg -qd ~/.secrets/cjsm-mfa) | pbcopy'
  oathtool --base32 --totp (gpg -qd ~/.secrets/cjsm-mfa) | pbcopy $argv; 
end
