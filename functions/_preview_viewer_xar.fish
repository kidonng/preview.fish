test (uname) = Darwin || exit

set -l cmd (status basename | path change-extension "")

function $cmd
    xar -tf $argv
end
