# Import Packages
import os
import subprocess
from libqtile import bar, layout, widget, hook, extension, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

# Keybingind
mod = 'mod4'
keys = [
    Key([mod], 'Return', lazy.spawn('kitty')),
    Key([mod, 'shift'], 'Return', lazy.spawn('emacs')),
    Key([mod], 'space', lazy.spawncmd()),
    Key([mod, 'shift'], 'q', lazy.window.kill()),
    Key([mod, 'shift'], 'r', lazy.reload_config()),
    Key([mod, 'shift'], 'e', lazy.shutdown()),
    Key([mod], 'f', lazy.window.toggle_fullscreen()),
    Key([mod], 'j', lazy.layout.next()),
    Key([mod], 'k', lazy.layout.previous()),
    Key([mod, 'shift'], 'j', lazy.layout.shuffle_left()),
    Key([mod, 'shift'], 'k', lazy.layout.shuffle_right()),
    Key([mod, 'control'], 'h', lazy.layout.grow_left().when(layout=['bsp', 'columns']), lazy.layout.shrink().when(layout=['monadtall', 'monadwide', 'monadthreecol'])),
    Key([mod, 'control'], 'l', lazy.layout.grow_right().when(layout=['bsp', 'columns']), lazy.layout.grow().when(layout=['monadtall', 'monadwide', 'monadthreecol'])),
    Key([mod], 'Tab', lazy.next_layout()),
    # alsa-utils
    Key([], 'XF86AudioRaiseVolume', lazy.spawn('amixer set Master 2%+')),
    Key([], 'XF86AudioLowerVolume', lazy.spawn('amixer set Master 2%-')),
    Key([], 'XF86AudioMute', lazy.spawn('amixer set Master toggle')),
    # brightnessctl
    Key([], 'XF86MonBrightnessUp', lazy.spawn('brightnessctl s +5%')),
    Key([], 'XF86MonBrightnessDown', lazy.spawn('brightnessctl s 5%-')),
]

# Group
groups = [Group(i) for i in '1234567890']
for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod, 'shift'], i.name, lazy.window.togroup(i.name, switch_group=True))
    ])

# Layout
layouts = [
    layout.MonadTall(),
    # layout.Columns(),
    # layout.Max(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
        ]

# StatusBar
widget_defaults = dict(
    font='sans bold',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()
screens = [
    Screen(
        wallpaper='~/dotfiles/wallpaper/wp1.jpg',
        wallpaper_mode='fill',
        bottom=bar.Bar(
            [
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),

                # Dependency: python-psutil
                # widget.CPU(format='CPU {load_percent}%'),
                # widget.Memory(format='RAM {MemUsed:.2f}{mm}', measure_mem='G'),

                # widget.Backlight(backlight_name='intel_backlight', format='MBL {percent:2.0%}'),
                widget.Battery(format='BAT {percent:2.0%}'),
                widget.Volume(fmt='VOL {}'),
                widget.Clock(format='%Y-%m-%d %H:%M'),

                # systray for X11
                widget.Systray(),

                # systray for Wayland
                # Dependency: python-pywlroots python-dbus-next xorg-xwayland
                # widget.StatusNotifier(),

                widget.CurrentLayoutIcon(scale=0.8),

                # If you want more widgets from third party,
                # check AUR qtile-extras-git (in Arch).
            ],
            24,
            margin=[0, 0, 0, 0],  # up, right, bottom, left
            border_width=[0, 0, 0, 0],
            border_color=['#000000', '#000000', '#000000', '#000000']
        ),
    ),
]

# Mouse Binding
mouse = [
    Drag([mod], 'Button1', lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], 'Button3', lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], 'Button2', lazy.window.bring_to_front()),
]

# MISCELLANEOUS
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
            *layout.Floating.default_float_rules,
            Match(wm_class='confirmreset'),  # gitk
            Match(wm_class='makebranch'),  # gitk
            Match(wm_class='maketag'),  # gitk
            Match(wm_class='ssh-askpass'),  # ssh-askpass
            Match(title='branchdialog'),  # gitk
            Match(title='pinentry'),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = 'smart'
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = 'LG3D'

# Autostart
@hook.subscribe.startup_once
def start_once():

    # Method 1: straightly use qtile.cmd_spawn function
    qtile.cmd_spawn('xclip')
    qtile.cmd_spawn('flameshot')
    qtile.cmd_spawn('nm-applet')
    qtile.cmd_spawn('ibus-daemon -drxR')
    # qtile.cmd_spawn('volumeicon')
    # qtile.cmd_spawn('xfce4-power-manager')
    qtile.cmd_spawn('[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources')
    # qtile.cmd_spawn('redshift -l 23.0:120.6 -t 5500:5000 -g 0.9 -m vidmode -o')

    # Method 2: Write a autostart script
    # home = os.path.expanduser('~')
    # subprocess.call([home + '/.config/qtile/autostart.sh'])
