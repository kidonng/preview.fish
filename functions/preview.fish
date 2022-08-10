function preview -d "Preview file content"
    for arg in $argv
        set_color -o
        # Show filename with LS_COLORS
        if command -sq exa
            exa --color always $arg
        else
            ls $arg
        end | string replace $HOME "~"
        set_color normal

        set -l extname (string replace . "" (path extension $arg))

        if functions -q _preview_ext_$extname
            _preview_ext_$extname $arg
            continue
        end

        set -l type (file -b $arg)
        set -l type_name (string replace -a -- " " _ $type)
        set -l mime (file -b --mime-type $arg)
        set -l mime_base (string split -f 1 / $mime[1])
        set -l mime_name (string replace / _ $mime[1])

        if functions -q _preview_type_$type_name
            _preview_type_$type_name $arg
        else if functions -q _preview_mime_$mime_name
            _preview_mime_$mime_name $arg
        else if functions -q _preview_mime_$mime_base
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
