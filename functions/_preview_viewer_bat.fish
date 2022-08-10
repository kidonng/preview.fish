command -sq bat || exit

set -l cmd (status basename | path change-extension "")

function $cmd
    bat --style auto --color always $argv
end
