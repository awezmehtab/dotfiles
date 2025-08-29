#!/usr/bin/env python3
from kitty.boss import get_boss
import os

TAB_FILE = os.path.expanduser("~/.config/kitty/.tabbar_toggle")

def is_hidden():
    return os.path.exists(TAB_FILE)

def main(args):
    boss = get_boss()
    if not boss:
        return

    if is_hidden():
        os.remove(TAB_FILE)
        boss.set_tab_bar_style("separator")
    else:
        open(TAB_FILE, "w").close()
        boss.set_tab_bar_style("hidden")
