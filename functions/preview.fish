function preview -d "Preview file content"
    set -lx BAT_ARGS --style numbers --color always
    test (count $argv) != 1 && set -l multi

    for arg in $argv
        if set -q newline
            echo
        else
            set -l newline
        end

        set -q multi && echo (set_color -o)$arg(set_color normal)

        set -l extname (string match -r -- '[^.]+$' $arg)

        if functions -q _preview_ext_$extname
            _preview_ext_$extname $arg
            break
        end

        set -l mime (file -b --mime-type $arg)
        set -l mime_base (string split -f 1 / $mime[1])
        set -l mime_name (string replace / _ $mime[1])

        if functions -q _preview_mime_$mime_base
            _preview_mime_$mime_base $arg
            break
        else if functions -q _preview_mime_$mime_name
            _preview_mime_$mime_name $arg
            break
        end

        file -b $arg
        echo "($mime[1])"
    end
end
