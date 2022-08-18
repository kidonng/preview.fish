if ! functions --query _preview_viewer_glow && ! functions --query _preview_viewer_bat
    exit
end

function _preview_ext_md
    if functions --query _preview_viewer_glow
        _preview_viewer_glow $argv
    else
        _preview_viewer_bat $argv
    end
end
