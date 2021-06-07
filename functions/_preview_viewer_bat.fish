command -sq bat || exit

set -l cmd (string replace .fish "" (status basename))

function $cmd
    bat --style numbers --color always $argv
end
