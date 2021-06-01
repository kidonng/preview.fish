if ! command -sq qlmanage || ! functions -q _preview_viewer_timg
    exit
end

set -l cmd (string replace .fish "" (status basename))

function $cmd
    set -l tmp (mktemp -d)

    qlmanage -t -s (math $COLUMNS x 8) -o $tmp $argv &>/dev/null
    _preview_viewer_timg $tmp/*

    rm -r $tmp
end
