command -sq glow || exit

set -l cmd (string replace .fish "" (status basename))

function $cmd
    test -n "$theme" && set -p argv -s $theme

    glow $argv
end
