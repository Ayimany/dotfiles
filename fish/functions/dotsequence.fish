function cd-expand-dots
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end

abbr --add dotexpansion --regex '^\.\.+$' --function cd-expand-dots
