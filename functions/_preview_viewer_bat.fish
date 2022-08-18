command --query bat || exit

set --local cmd (status basename | path change-extension "")

function $cmd
    bat --style auto --color always $argv
end
