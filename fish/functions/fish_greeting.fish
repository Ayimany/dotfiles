function fish_greeting
    echo -e "\nDrink water. Tell bae you love her.\n"

    if test -n "$fish_private_mode"
        set_color red
        echo ">> Shell has entered private mode."
	set_color normal
    end
end
