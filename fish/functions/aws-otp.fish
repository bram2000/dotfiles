function aws-otp --wraps='oathtool --base32 --totp (gpg -qd ~/.secrets/hmrc-aws-mfa) | pbcopy' --description 'alias aws-otp oathtool --base32 --totp (gpg -qd ~/.secrets/hmrc-aws-mfa) | pbcopy'
  oathtool --base32 --totp (gpg -qd ~/.secrets/hmrc-aws-mfa) | pbcopy $argv; 
end
