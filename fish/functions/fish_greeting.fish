function fish_greeting
    echo -e "Drink water. Be yourself. Love exists.\n"

    if test -n "$fish_private_mode"
        set_color red
        echo ">> Shell has entered private mode."
	set_color normal
    end
end
