command -sq delta || exit

set -l cmd (path change-extension "" (status basename))

function $cmd
    delta <$argv
end
