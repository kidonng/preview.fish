test (uname) = Darwin || exit

set -l cmd (path change-extension "" (status basename))

function $cmd
    plutil -p $argv
end
