import sys

def is_vanilla() -> bool:
    import sys
    return not hasattr(__builtins__, "__IPYTHON__") and "bpython" not in sys.argv[0]

def setup_history():
    import os
    import atexit
    import readline
    from pathlib import Path

    if state_home := os.environ.get("XDG_STATE_HOME"):
        state_home = Path(state_home)
    else:
        state_home = Path.home() / ".local" / "state"

    if not state_home.exists():
        os.mkdir(state_home)

    history: Path = state_home / "python_history"

    if not history.exists():
        file = open(history, "w")
        file.close()

    readline.read_history_file(str(history))
    atexit.register(readline.write_history_file, str(history))

if is_vanilla():
    setup_history()

sys.ps1="\x01\x1b[1;49;33m\x02\x01\x1b[1;49;30;43m\x02  \x01\x1b[1;49;33m\x02\x01\x1b[0m\x02 "
sys.ps2="\x01\x1b[1;49;33m\x02    \x01\x1b[0m\x02 "
