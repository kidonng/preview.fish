set -l cmd (path change-extension "" (status basename))

function $cmd
    unzip -l $argv
end
