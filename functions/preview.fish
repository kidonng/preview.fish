function preview -d "Preview file content"
    test (count $argv) != 1 && set -l multi
    set -l newline

    for arg in $argv
        if test "$newline" = 1
            echo
        else
            set newline 1
        end

        set -q multi && echo (set_color -o)$arg(set_color normal)

        set -l extname (string match -r -- '[^.]+$' $arg)

        if functions -q _preview_ext_$extname
            _preview_ext_$extname $arg
            continue
        end

        set -l type (file -b $arg | string replace -a " " _)
        set -l mime (file -b --mime-type $arg)
        set -l mime_base (string split -f 1 / $mime[1])
        set -l mime_name (string replace / _ $mime[1])

        if functions -q _preview_type_$type
            _preview_type_$type $arg
            continue
        else if functions -q _preview_mime_$mime_name
            _preview_mime_$mime_name $arg
            continue
        else if functions -q _preview_mime_$mime_base
            _preview_mime_$mime_base $arg
            continue
        end

        file -b $arg
        echo "($mime[1])"
    end
end
