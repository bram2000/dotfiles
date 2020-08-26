# Defined in - @ line 1
function aws-otp --description 'alias aws-otp oathtool --base32 --totp (gpg -qd ~/.aws/aws-mfa-secret)'
	oathtool --base32 --totp (gpg -qd ~/.aws/aws-mfa-secret) $argv | pbcopy;
    echo "otp copied to clipboard"
end
