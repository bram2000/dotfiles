function s3-csvlook
	aws s3 cp $argv - | csvlook -I | less -S
end
