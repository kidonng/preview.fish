command -sq delta || exit

set -l cmd (status basename | path change-extension "")

function $cmd
    delta <$argv
end
