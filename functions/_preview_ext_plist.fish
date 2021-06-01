command -sq plutil || exit

function _preview_ext_plist
    plutil -p $argv
end
