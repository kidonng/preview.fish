set --local cmd (status basename | path change-extension "")

function $cmd
    xz --list $argv
end
