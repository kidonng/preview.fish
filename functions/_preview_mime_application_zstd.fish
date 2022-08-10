function _preview_mime_application_zstd
    if string match -q "*.tar.zst" $argv
        _preview_viewer_tar $argv
    else
        _preview_viewer_zstd $argv
    end
end
