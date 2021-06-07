command -sq plutil || exit

set -l cmd (string replace .fish "" (status basename))

function $cmd
    plutil -p $argv
end
