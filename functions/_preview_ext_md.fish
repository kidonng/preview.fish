command -sq glow || exit

function _preview_ext_md
    set -q theme && set -p argv -s $theme

    glow $argv
end
