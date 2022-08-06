command -sq glow || exit

set -l cmd (path change-extension "" (status basename))

function $cmd
    test -n "$theme" && set -p argv -s $theme

    glow $argv
end
