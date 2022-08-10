set -l cmd (status basename | path change-extension "")

function $cmd
    gzip -l $argv
end
