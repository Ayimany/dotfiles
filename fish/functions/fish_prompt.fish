function fish_prompt
    set -g last_status $status
    set -g divider ""
    set -g color_index 1
    set -g colors normal magenta yellow cyan green blue red
    set -g current_color $colors[$color_index]
    set -g text_color "#1e1e2e"

    function shift_color
        set color_index (math $color_index + 1)
        set current_color $colors[$color_index]
    end

    function open_section
        set prev_color $current_color
        shift_color

        printf "$(set_color -b $prev_color $current_color)$divider$(set_color -b $current_color $text_color)"
    end

    set format "$(open_section) 󰉋 $(prompt_pwd --dir-length=1) "

    if test -e .git
        set format "$format$(open_section)  $(git branch --color=never --show-current) "

        set vcs_status "$(git status)"

        set vcscfc (echo "$vcs_status" | rg "modified" | wc -l)
        if test $vcscfc -gt 0; set format "$format $vcscfc "; end

        set vcscfc (echo "$vcs_status" | rg "new file" | wc -l)
        if test $vcscfc -gt 0; set format "$format $vcscfc "; end

        set vcscfc (echo "$vcs_status" | rg "deleted" | wc -l)
        if test $vcscfc -gt 0; set format "$format $vcscfc "; end
    end

    if test $last_status -ne 0
        set format "$format$(open_section)  $last_status "
    end

    printf "\n$format$(set_color -b normal $current_color)$(set_color -b normal normal) "
    
end
