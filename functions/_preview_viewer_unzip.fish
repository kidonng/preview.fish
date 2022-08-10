set -l cmd (path change-extension "" (status basename))

function $cmd
    # Strip archive filename
    unzip -l $argv | tail -n +2
end
