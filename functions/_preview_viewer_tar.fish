set -l cmd (path change-extension "" (status basename))

function $cmd
    tar -tf $argv
end
