functions -q _preview_viewer_bat || exit

function _preview_mime_application_json
    _preview_viewer_bat -l json $argv
end
