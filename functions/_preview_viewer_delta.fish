command --query delta || exit

set --local cmd (status basename | path change-extension "")

function $cmd
    delta <$argv
end
