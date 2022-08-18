functions --query _preview_viewer_bat || exit

function _preview_mime_application_javascript
    _preview_viewer_bat --language js $argv
end
