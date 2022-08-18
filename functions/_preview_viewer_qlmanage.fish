if test (uname) != Darwin || ! functions --query _preview_viewer_timg
    exit
end

set --local cmd (status basename | path change-extension "")

function $cmd
    set --local tmp (mktemp -d)

    qlmanage -t -s (math $COLUMNS x 8) -o $tmp $argv &>/dev/null
    _preview_viewer_timg $tmp/*

    rm -r $tmp
end
