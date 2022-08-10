test (uname) = Darwin || exit

set -l cmd (path change-extension "" (status basename))

function $cmd
    xar -tf $argv
end
