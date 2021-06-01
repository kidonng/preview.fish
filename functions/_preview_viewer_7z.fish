command -sq 7z || exit

set -l cmd (string replace .fish "" (status basename))

function $cmd
    7z l $argv | tail -n +12
end
