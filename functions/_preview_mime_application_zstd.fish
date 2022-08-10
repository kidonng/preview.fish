if ! functions -q _preview_viewer_tar && ! functions -q _preview_viewer_zstd
    exit
end

function _preview_mime_application_zstd
    if string match -q "*.tar.zst" $argv
        _preview_viewer_tar $argv
    else
        _preview_viewer_zstd $argv
    end
end
