command -sq timg || exit

set -l cmd (string replace .fish "" (status basename))

function $cmd
    timg -g (math $COLUMNS - 2)x$LINES --frames 1 $argv
end
