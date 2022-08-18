set --local cmd (status basename | path change-extension "")

function $cmd
    # Strip archive filename
    unzip -l $argv | tail -n +2
end
