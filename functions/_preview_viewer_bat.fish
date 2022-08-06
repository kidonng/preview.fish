command -sq bat || exit

set -l cmd (path change-extension "" (status basename))

function $cmd
    bat --style auto --color always $argv
end
