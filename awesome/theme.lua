---- Load Packages
local theme_assets = require('beautiful.theme_assets')
local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi
local gfs = require('gears.filesystem')
local themes_path = gfs.get_themes_dir()
local theme = {}

---- General
theme.font = 'sans bold 10'
theme.bg_normal = '#11111b'
theme.bg_focus = '#11111b'
theme.bg_urgent = '#f38ba8'
theme.bg_minimize = '#11111b'
theme.bg_systray = '#11111b'
theme.fg_normal = '#cdd6f4'
theme.fg_focus = '#cdd6f4'
theme.fg_urgent = '#11111b'
theme.fg_minimize = '#cdd6f4'

---- Gap
theme.useless_gap = dpi(1)

---- Border
theme.border_width = dpi(1)
theme.border_normal = '#11111b'
theme.border_focus = '#a6e3a1'
theme.border_marked = '#f38ba8'

---- Taglist
theme.taglist_font = 'sans bold 12'
theme.taglist_bg_focus = '#11111b'
theme.taglist_bg_occupied = '#11111b'
theme.taglist_bg_empty = '#11111b'
theme.taglist_fg_focus = '#a6e3a1'
theme.taglist_fg_occupied = '#6c7086'
theme.taglist_fg_empty = '#11111b'
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(dpi(0), '#45475a')
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(dpi(0), '#cdd6f4')

---- Prompt
theme.prompt_bg = '#11111b'
theme.prompt_bg_cursor = '#cdd6f4'
theme.prompt_fg = '#cdd6f4'
theme.prompt_fg_cursor = '#11111b'

---- Hotkey
theme.hotkeys_font = 'sans bold 10'
theme.hotkeys_description_font = 'sans bold 10'
theme.hotkeys_group_margin = dpi(20)
theme.hotkeys_modifiers_fg = '#a6e3a1'
theme.hotkeys_label_bg = '#11111b'
theme.hotkeys_label_fg = '#cdd6f4'
theme.hotkeys_bg = '#11111b'
theme.hotkeys_fg = '#cdd6f4'
theme.hotkeys_border_color = '#89b4fa'
theme.hotkeys_border_width = dpi(2)

---- Notification
theme.notification_font = 'sans bold 10'
theme.notification_bg = '#11111b'
theme.notification_fg = '#cdd6f4'
theme.notification_border_color = '#45475a'
theme.notification_border_width = dpi(2)
theme.notification_icon_size = dpi(32)
theme.notification_width = dpi(360)
theme.notification_height = dpi(60)
theme.notification_margin = dpi(10)

-- @Bug: awesome from arch official repo, theme.notification_xxxx not work
-- @REF: https://www.reddit.com/r/awesomewm/comments/glyl6b/theming_weirdness/
require('naughty').config.defaults.margin = theme.notification_margin
require('naughty').config.defaults.border_width = theme.notification_border_width

---- Awesome Icon
theme.awesome_icon = theme_assets.awesome_icon(dpi(30), '#a6e3a1', '#11111b')

---- Menu
theme.menu_font = 'sans bold 10'
theme.menu_bg_normal = '#11111b'
theme.menu_bg_focus = '#a6e3a1'
theme.menu_fg_normal = '#cdd6f4'
theme.menu_fg_focus = '#11111b'
theme.menu_border_color = '#11111b'
theme.menu_border_width = dpi(1)
theme.menu_submenu_icon = themes_path..'default/submenu.png'
theme.menu_height = dpi(30)
theme.menu_width = dpi(180)

---- Wallpaper
theme.wallpaper = nil
-- theme.wallpaper = themes_path..'default/background.png'

---- TitleBar
theme.titlebar_bg_focus = '#11111b'
theme.titlebar_bg_normal = '#11111b'
theme.titlebar_fg_focus = '#cdd6f4'
theme.titlebar_fg_normal = '#11111b'
theme.titlebar_close_button_normal = themes_path..'default/titlebar/close_normal.png'
theme.titlebar_close_button_focus = themes_path..'default/titlebar/close_focus.png'
theme.titlebar_minimize_button_normal = themes_path..'default/titlebar/minimize_normal.png'
theme.titlebar_minimize_button_focus = themes_path..'default/titlebar/minimize_focus.png'
theme.titlebar_ontop_button_normal_inactive = themes_path..'default/titlebar/ontop_normal_inactive.png'
theme.titlebar_ontop_button_focus_inactive = themes_path..'default/titlebar/ontop_focus_inactive.png'
theme.titlebar_ontop_button_normal_active = themes_path..'default/titlebar/ontop_normal_active.png'
theme.titlebar_ontop_button_focus_active = themes_path..'default/titlebar/ontop_focus_active.png'
theme.titlebar_sticky_button_normal_inactive = themes_path..'default/titlebar/sticky_normal_inactive.png'
theme.titlebar_sticky_button_focus_inactive = themes_path..'default/titlebar/sticky_focus_inactive.png'
theme.titlebar_sticky_button_normal_active = themes_path..'default/titlebar/sticky_normal_active.png'
theme.titlebar_sticky_button_focus_active = themes_path..'default/titlebar/sticky_focus_active.png'
theme.titlebar_floating_button_normal_inactive = themes_path..'default/titlebar/floating_normal_inactive.png'
theme.titlebar_floating_button_focus_inactive = themes_path..'default/titlebar/floating_focus_inactive.png'
theme.titlebar_floating_button_normal_active = themes_path..'default/titlebar/floating_normal_active.png'
theme.titlebar_floating_button_focus_active = themes_path..'default/titlebar/floating_focus_active.png'
theme.titlebar_maximized_button_normal_inactive = themes_path..'default/titlebar/maximized_normal_inactive.png'
theme.titlebar_maximized_button_focus_inactive = themes_path..'default/titlebar/maximized_focus_inactive.png'
theme.titlebar_maximized_button_normal_active = themes_path..'default/titlebar/maximized_normal_active.png'
theme.titlebar_maximized_button_focus_active = themes_path..'default/titlebar/maximized_focus_active.png'

---- Layout
theme.layout_fairh = themes_path..'default/layouts/fairhw.png'
theme.layout_fairv = themes_path..'default/layouts/fairvw.png'
theme.layout_floating = themes_path..'default/layouts/floatingw.png'
theme.layout_magnifier = themes_path..'default/layouts/magnifierw.png'
theme.layout_max = themes_path..'default/layouts/maxw.png'
theme.layout_fullscreen = themes_path..'default/layouts/fullscreenw.png'
theme.layout_tilebottom = themes_path..'default/layouts/tilebottomw.png'
theme.layout_tileleft = themes_path..'default/layouts/tileleftw.png'
theme.layout_tile = themes_path..'default/layouts/tilew.png'
theme.layout_tiletop = themes_path..'default/layouts/tiletopw.png'
theme.layout_spiral = themes_path..'default/layouts/spiralw.png'
theme.layout_dwindle = themes_path..'default/layouts/dwindlew.png'
theme.layout_cornernw = themes_path..'default/layouts/cornernww.png'
theme.layout_cornerne = themes_path..'default/layouts/cornernew.png'
theme.layout_cornersw = themes_path..'default/layouts/cornersww.png'
theme.layout_cornerse = themes_path..'default/layouts/cornersew.png'

---- Custom Icon Theme
-- default path: /usr/share/icons, /usr/share/icons/hicolor
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
