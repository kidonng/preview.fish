command -sq zstd || exit

set -l cmd (path change-extension "" (status basename))

function $cmd
    zstd -l $argv
end
