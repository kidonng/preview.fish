command -sq glow || exit

set -l cmd (status basename | path change-extension "")

function $cmd
    test -n "$theme" && set -p argv -s $theme

    glow $argv
end
