function _preview_mime_application_gzip
	if string match -q "*.tar.gz" $argv || test (path extension $argv) = .tgz
		_preview_viewer_tar $argv
	else
		_preview_viewer_gzip $argv
	end
end
