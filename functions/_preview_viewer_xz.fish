set -l cmd (path change-extension "" (status basename))

function $cmd
    xz -l $argv
end
