# Debug with `kitty --debug-keyboard`
import re

from kittens.ssh.utils import is_kitten_cmdline as is_ssh_kitten_cmdline
from kittens.tui.handler import result_handler
from kitty.key_encoding import KeyEvent
from kitty.key_encoding import parse_shortcut

DEFAULT_VIM_ID = "n?vim|n|l"

SSH_TITLE_MATCH = re.compile(r"^.*: (nvim|n|l)(\s+\S+|$)")
LOCAL_CMD_MATCH = re.compile("n?vim")


def is_window_vim(window, vim_id):
    fg_processes = window.child.foreground_processes
    window_title = window.child_title

    if any(is_ssh_kitten_cmdline(p["cmdline"]) for p in fg_processes):
        is_vim_ssh = bool(SSH_TITLE_MATCH.match(window_title))
        print("is vim via ssh: ", is_vim_ssh)
        return is_vim_ssh

    is_vim_local = any(
        re.search(vim_id, p["cmdline"][0] if p["cmdline"] else "", re.I)
        for p in fg_processes
    )
    print("is vim via local:", is_vim_local)
    return is_vim_local


def encode_key_mapping(window, key_mapping):
    mods, key = parse_shortcut(key_mapping)
    event = KeyEvent(
        mods=mods,
        key=key,
        shift=bool(mods & 1),
        alt=bool(mods & 2),
        ctrl=bool(mods & 4),
        super=bool(mods & 8),
        hyper=bool(mods & 16),
        meta=bool(mods & 32),
    ).as_window_system_event()

    return window.encoded_key(event)


def main():
    pass


@result_handler(no_ui=True)
def handle_result(args, result, target_window_id, boss):
    window = boss.window_id_map.get(target_window_id)
    direction = args[2]
    key_mapping = args[3]
    vim_id = args[4] if len(args) > 4 else DEFAULT_VIM_ID

    if window is None:
        return
    if is_window_vim(window, vim_id):
        encoded = encode_key_mapping(window, key_mapping)
        window.write_to_child(encoded)
    else:
        boss.active_tab.neighboring_window(direction)
