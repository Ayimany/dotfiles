function fish_prompt
    set -l last_status "$status"
    set -l status_color "red"

    if [ $last_status -eq 0 ]
	set status_color "green"
    end

    echo (set_color "$status_color")"$last_status"(set_color normal)\
        (prompt_pwd)(fish_vcs_prompt)
    echo "> "
end
