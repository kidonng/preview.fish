test (uname) = Darwin || exit

set --local cmd (status basename | path change-extension "")

function $cmd
    xar -tf $argv
end
