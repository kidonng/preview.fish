set --local cmd (status basename | path change-extension "")

function $cmd
    gzip --list $argv
end
