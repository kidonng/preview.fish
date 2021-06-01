command -sq bat || exit

function _preview_mime_application_json
    bat $BAT_ARGS -l json $argv
end
