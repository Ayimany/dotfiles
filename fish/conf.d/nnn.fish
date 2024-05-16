if ! status --is-login
    exit 0
end

set -g BLK "03"
set -g CHR "03"
set -g DIR "04"
set -g EXE "02"
set -g REG "07"
set -g HARDLINK "05"
set -g SYMLINK "05"
set -g MISSING "08"
set -g ORPHAN "01"
set -g FIFO "06"
set -g SOCK "03"
set -g UNKNOWN "01"

set -gx NNN_COLORS "04020301;4231"
set -gx NNN_FCOLORS "$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$UNKNOWN"

