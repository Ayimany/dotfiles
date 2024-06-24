function fish_greeting
    set format "$(set_color magenta)$(set_color -b magenta '#1e1e2e')  "

    if test -n "$fish_private_mode"
        set format "$format 󰗹 "
	set_color normal
    end

    set format "$format$(set_color -b normal magenta)$(set_color -b normal normal)"
    echo $format
end
