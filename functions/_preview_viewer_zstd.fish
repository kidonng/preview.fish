command --query zstd || exit

set --local cmd (status basename | path change-extension "")

function $cmd
    zstd --list $argv
end
