function preview --description "Preview file content"
    for arg in $argv
        set_color --bold
        # Show filename with LS_COLORS
        if command --query exa
            exa --color always $arg
        else
            ls $arg
        end | string replace $HOME "~"
        set_color normal

        set --local extname (path extension $arg | string replace . "")

        if functions --query _preview_ext_$extname
            _preview_ext_$extname $arg
            continue
        end

        set --local type (file --brief $arg)
        set --local type_name (string split --fields 1 -- , $type | string replace --all " " _)
        set --local mime (file --brief --mime-type $arg)
        set --local mime_base (string split --fields 1 / $mime[1])
        set --local mime_name (string replace / _ $mime[1])

        if functions --query _preview_type_$type_name
            _preview_type_$type_name $arg
        else if functions --query _preview_mime_$mime_name
            _preview_mime_$mime_name $arg
        else if functions --query _preview_mime_$mime_base
            _preview_mime_$mime_base $arg
        else
            echo $type
            echo "($mime[1])"
        end

        if test "$arg" != "$argv[-1]"
            printf \n
        end
    end
end
