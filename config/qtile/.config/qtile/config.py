# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

# from qtile_extras import widget
# from qtile_extras.widget.decorations import BorderDecoration

import colors
import os
import subprocess
import json

mod = "mod4"
# terminal = guess_terminal()
terminal = "kitty"

font_name = "JetBrainsMono Nerd Font"


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    # Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]
group_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]
#group_labels = ["DEV", "WWW", "SYS", "DOC", "VBOX", "CHAT", "MUS", "VID", "GFX",]
#group_labels = ["", "", "", "", "", "", "", "", "",]

group_layouts = ["monadtall", "monadtall", "tile", "tile", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall"]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))


for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

colors = [
    "#002b36", # bg
    "#839496", # fg
    "#073642", # color01
    "#dc322f", # color02
    "#859900", # color03
    "#b58900", # color04
    "#268bd2", # color05
    "#d33682", # color06
    "#2aa198"  # color15
]

theme = {
    "background": colors[0],
    "foreground": colors[1],
    "selected_foreground": colors[4],
    "border_normal": colors[0],
    "border_focus": colors[8],
    "highlight": colors[2],
    "current_screen_border": colors[7],
    "screen_border": colors[4],
    "windowname": colors[6]

}

if os.path.exists('/home/maurice/.config/mko/current/theme/qtile.json'):
    with open('/home/maurice/.config/mko/current/theme/qtile.json','r') as f:
        override_theme =json.load(f)
        theme.update(override_theme)


layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": theme['border_focus'],
                "border_normal": theme['border_normal']
                }



layouts = [
    layout.Columns(**layout_theme),
    layout.Max(
        border_width = 0,
         margin = 0,
    )
    
]

widget_defaults = dict(
    font=font_name,
    fontsize=14,
    padding=4,
    background=theme['background']
)
extension_defaults = widget_defaults.copy()


def init_widgets_list():
    return [
        
        widget.Prompt(
            font = font_name,
            fontsize=14,
            foreground = theme['foreground']
        ),

        widget.CurrentLayout(
            foreground = theme['selected_foreground'],
            padding = 5
        ),
        widget.TextBox(
            text = '|',
            font = font_name,
            foreground = theme['foreground'],
            padding = 2,
            fontsize = 14
            ),
        widget.GroupBox(
            fontsize = 12,
            margin_y = 5,
            margin_x = 5,
            padding_y = 0,
            padding_x = 1,
            borderwidth = 3,
            active = theme['selected_foreground'],
            inactive = theme['foreground'],
            rounded = False,
            highlight_color = theme['highlight'],
            highlight_method = "line",
            this_current_screen_border = theme['current_screen_border'],
            this_screen_border = theme['screen_border'],
            other_current_screen_border = theme['current_screen_border'],
            other_screen_border = theme['screen_border'],
        ),
        widget.TextBox(
            text = '|',
            font = font_name,
            foreground = theme['foreground'],
            padding = 2,
            fontsize = 14
            ),
        widget.WindowName(
            foreground = theme['windowname'],
            max_chars = 40
        ),
        widget.Chord(
            chords_colors={
                "launch": ("#ff0000", "#ffffff"),
            },
            name_transform=lambda name: name.upper(),
        ),
        # widget.TextBox("default config", name="default"),
        # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
        # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
        # widget.StatusNotifier(),
        widget.Spacer(length = 8),
        widget.Systray(
            padding = 3
        ),
        widget.Spacer(length = 8),
        widget.Clock(   
            foreground = theme['foreground'],
            format = "⏱  %A, %d %B - %H:%M",
        ),
        widget.Spacer(length = 8),
    ]


def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_list(), size=26))]

screens = init_screens()



def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)

def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)

def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)



# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

@hook.subscribe.startup_once
def autostart():
   home = os.path.expanduser('~/.config/qtile/scripts/autostart.sh')
   subprocess.run([home])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
