command -sq bat || exit

function _preview_mime_text
    bat $BAT_ARGS $argv
end
