set -l index_pwd 1
set -l index_stat 2
set -l index_branch 3

function generate_colorscheme
    set -l scheme 'yellow' 'cyan' 'magenta' 'green'

    if test "$1" -ne 0
        set scheme 'yellow' 'cyan' 'magenta' 'red'
    end

    printf '%s' "$scheme"
end

function get_color
    set -l target = "$1"
    set -l colorscheme = (echo "$2" | tr ' ' "\n")

    switch $target
        case 'dir'
	    printf '%s' "$colorscheme[1]"
	    return
        case 'git'
	    printf '%s' "$colorscheme[2]"
	    return
        case 'status'
	    printf '%s' "$colorscheme[4]"
	    return
    end
end

function generate_segment
    set -l content "$argv[1]"
    set -l this_sc "$argv[2]"

    printf '%s %s %s'                      \
	    (set_color -b $this_sc -o brblack) \
	    "$content"                         \
	    (set_color normal)                 \

end

function generate_separator
    set -l this_sc "$argv[1]"
    set -l next_sc "$argv[2]"

    if test -z "$next_sc"
	set next_sc 'normal'
    end

    printf '%s' (set_color -b $next_sc $this_sc) $ss
end

function generate_opening
    printf '%s' (set_color $argv[1])
end

function fish_prompt
    set -l dircolor    blue
    set -l gitcolor    magenta

    set -l last_color $dircolor

    generate_opening $last_color
    generate_segment "  $(prompt_pwd)" $dircolor

    if test -e .git
	generate_separator $last_color $gitcolor
	generate_segment " $(git branch --no-color --show-current)" $gitcolor
	set last_color $gitcolor
    end

    generate_separator $last_color

    set_color normal
    printf ' '

end

function fish_right_prompt
    set -l lstatus "$status"
    set -l status_icon '󰄬'
    set -l statuscolor green

    if test $lstatus -ne 0
        set status_icon '󰅖'
        set statuscolor red
    end

    generate_opening $statuscolor
    generate_segment "$status_icon $lstatus" $statuscolor
    generate_separator $statuscolor
end

