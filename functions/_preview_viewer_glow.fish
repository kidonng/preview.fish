command --query glow || exit

set --local cmd (status basename | path change-extension "")

function $cmd
    test -n "$theme" && set --prepend argv --style $theme

    glow $argv
end
