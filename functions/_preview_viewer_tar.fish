set --local cmd (status basename | path change-extension "")

function $cmd
    tar --list -f $argv
end
