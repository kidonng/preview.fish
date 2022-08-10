set -l cmd (path change-extension "" (status basename))

function $cmd
    gzip -l $argv
end
