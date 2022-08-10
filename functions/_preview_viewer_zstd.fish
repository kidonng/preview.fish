command -sq zstd || exit

set -l cmd (status basename | path change-extension "")

function $cmd
    zstd -l $argv
end
