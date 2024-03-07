-- Load Packages
local theme_assets = require('beautiful.theme_assets')
local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi
local gfs = require('gears.filesystem')
local themes_path = gfs.get_themes_dir()
local theme = {}

-- General
theme.font = 'sans bold 10'
theme.bg_normal = '#222222'
theme.bg_focus = '#535d6c'
theme.bg_urgent = '#ff0000'
theme.bg_minimize = '#444444'
theme.bg_systray = '#222222'
theme.fg_normal = '#aaaaaa'
theme.fg_focus = '#ffffff'
theme.fg_urgent = '#ffffff'
theme.fg_minimize = '#ffffff'

-- Gap
theme.useless_gap = dpi(1)

-- Border
theme.border_width = dpi(1)
theme.border_normal = '#000000'
theme.border_focus = '#535d6c'
theme.border_marked = '#ff0000'

-- Taglist
theme.taglist_font = 'sans bold 10'
theme.taglist_bg_focus = '#535d6c'
theme.taglist_bg_occupied = '#222222'
theme.taglist_bg_empty = '#222222'
theme.taglist_fg_focus = '#ffffff'
theme.taglist_fg_occupied = '#ffffff'
theme.taglist_fg_empty = '#222222'
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(dpi(5), '#ffffff')
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(dpi(5), '#ffffff')

-- Prompt
theme.prompt_bg = '#222222'
theme.prompt_bg_cursor = '#ffffff'
theme.prompt_fg = '#ffffff'
theme.prompt_fg_cursor = '#222222'

-- Hotkey
theme.hotkeys_font = 'sans bold 10'
theme.hotkeys_description_font = 'sans bold 10'
theme.hotkeys_group_margin = dpi(20)
theme.hotkeys_modifiers_fg = '#ffffff'
theme.hotkeys_label_bg = '#222222'
theme.hotkeys_label_fg = '#ffffff'
theme.hotkeys_bg = '#222222'
theme.hotkeys_fg = '#ffffff'
theme.hotkeys_border_color = '#ffffff'
theme.hotkeys_border_width = dpi(2)

-- Notification
theme.notification_font = 'sans bold 10'
theme.notification_bg = '#222222'
theme.notification_fg = '#ffffff'
theme.notification_border_color = '#45475a'
theme.notification_border_width = dpi(2)
theme.notification_icon_size = dpi(32)
theme.notification_width = dpi(360)
theme.notification_height = dpi(60)
theme.notification_margin = dpi(10)

-- Awesome Icon
theme.awesome_icon = theme_assets.awesome_icon(dpi(30), '#535d6c', '#ffffff')

-- Menu
theme.menu_font = 'sans bold 10'
theme.menu_bg_normal = '#222222'
theme.menu_bg_focus = '#535d6c'
theme.menu_fg_normal = '#ffffff'
theme.menu_fg_focus = '#ffffff'
theme.menu_border_color = '#222222'
theme.menu_border_width = dpi(0)
theme.menu_submenu_icon = themes_path..'default/submenu.png'
theme.menu_height = dpi(30)
theme.menu_width = dpi(180)

-- Wallpaper
theme.wallpaper = nil
-- theme.wallpaper = themes_path..'default/background.png'

-- TitleBar
theme.titlebar_bg_focus = '#222222'
theme.titlebar_bg_normal = '#222222'
theme.titlebar_fg_focus = '#ffffff'
theme.titlebar_fg_normal = '#535d6c'
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

-- Layout
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

-- Custom Icon Theme
-- default path: /usr/share/icons, /usr/share/icons/hicolor
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
