command --query 7z || exit

set --local cmd (status basename | path change-extension "")

function $cmd
    # Strip header
    7z l $argv | tail -n +12
end
