command -sq 7z || exit

set -l cmd (path change-extension "" (status basename))

function $cmd
    # Strip header
    7z l $argv | tail -n +12
end
