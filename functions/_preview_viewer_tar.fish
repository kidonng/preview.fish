set -l cmd (status basename | path change-extension "")

function $cmd
    tar -tf $argv
end
