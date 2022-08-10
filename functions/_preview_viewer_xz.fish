set -l cmd (status basename | path change-extension "")

function $cmd
    xz -l $argv
end
