command -sq timg || exit

set -l cmd (status basename | path change-extension "")

function $cmd
    timg -g (math $COLUMNS - 2)x$LINES --frames 1 $argv
end
