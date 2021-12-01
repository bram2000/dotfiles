function orion-otp --wraps='oathtool --base32 --totp (gpg -qd ~/.secrets/orion-mfa) | pbcopy' --description 'alias orion-otp oathtool --base32 --totp (gpg -qd ~/.secrets/orion-mfa) | pbcopy'
  orion-otp-echo | pbcopy $argv; 
end
