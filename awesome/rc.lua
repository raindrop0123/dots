---- Load Package
pcall(require, 'luarocks.loader')
local gears = require('gears')
local awful = require('awful')
require('awful.autofocus')
local wibox = require('wibox')
local beautiful = require('beautiful')
local naughty = require('naughty')
local menubar = require('menubar')
local hotkeys_popup = require('awful.hotkeys_popup')
require('awful.hotkeys_popup.keys')

---- Error Handling
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = 'There were errors during startup!',
    text = awesome.startup_errors
  })
end
do
  local in_error = false
  awesome.connect_signal('debug::error',
    function(err)
      -- Make sure we don't go into an endless error loop
      if in_error then return end
      in_error = true
      naughty.notify({
        preset = naughty.config.presets.critical,
        title = 'An error happened!',
        text = tostring(err)
      })
      in_error = false
    end)
end

---- Variable Definition
-- Theme Initialization
-- Path = ~/.config/awesome/theme.lua
beautiful.init(gears.filesystem.get_configuration_dir() .. 'theme.lua')

-- This is used later as the default terminal and editor to run.
local terminal = 'alacritty'
local editor = os.getenv('EDITOR') or 'emacs -nw'
local editor_cmd = terminal .. ' -e ' .. editor

-- Mod Key: Mod1=alt, Mod4=win
local modkey = 'Mod4'
local altkey = 'Mod1'

-- Layout
awful.layout.layouts = {
  -- awful.layout.suit.floating,
  awful.layout.suit.tile,
  -- awful.layout.suit.tile.left,
  -- awful.layout.suit.tile.bottom,
  -- awful.layout.suit.tile.top,
  -- awful.layout.suit.fair,
  -- awful.layout.suit.fair.horizontal,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  -- awful.layout.suit.max,
  -- awful.layout.suit.max.fullscreen,
  -- awful.layout.suit.magnifier,
  -- awful.layout.suit.corner.nw,
  -- awful.layout.suit.corner.ne,
  -- awful.layout.suit.corner.sw,
  -- awful.layout.suit.corner.se,
}

---- Menu
local mysystemmenu = {
  { 'Suspend', function() awful.spawn.with_shell('systemctl suspend') end },
  { 'Reboot', function() awful.spawn.with_shell('reboot') end },
  { 'Power Off', function() awful.spawn.with_shell('poweroff') end },
}
local myawesomemenu = {
  { 'Hotkeys', function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { 'Manual', terminal .. ' -e man awesome' },
  { 'Edit Config', editor_cmd .. ' ' .. awesome.conffile },
  { 'Restart', awesome.restart },
  { 'Quit', function() awesome.quit() end },
}
local mymainmenu = awful.menu({
  items = {
    { 'Awesome', myawesomemenu, beautiful.awesome_icon },
    { 'Terminal', terminal },
    { 'Emacs', function() awful.spawn.with_shell('emacs') end },
    { 'Chrome', function() awful.spawn.with_shell('google-chrome-stable') end },
    { 'File Manager', function() awful.spawn.with_shell('pcmanfm') end },
    { 'System', mysystemmenu },
  }})
local mylauncher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = mymainmenu
})
menubar.utils.terminal = terminal

---- Wibar

-- Taglist Binding
local taglist_buttons = gears.table.join(
  awful.button({}, 1,
    function(t)
      t:view_only()
    end)
)

-- Wallpaper Setup
local function set_wallpaper(s)
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == 'function' then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
    -- gears.wallpaper.set('#11111b')
  end
end

-- Reset wallpaper when a screen's geometry changes
screen.connect_signal('property::geometry', set_wallpaper)

awful.screen.connect_for_each_screen(
  function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag(
      { ' 1 ', ' 2 ', ' 3 ', ' 4 ', ' 5 ', ' 6 ', ' 7 ', ' 8 ', ' 9 ', ' 0 ' },
      s,
      awful.layout.layouts[1]
    )

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist({
      screen  = s,
      filter  = awful.widget.taglist.filter.noempty,
      buttons = taglist_buttons,
    })

    -- Create the wibox
    s.mywibox = awful.wibar({
      height = 24,
      position = 'top',
      screen = s,
    })

    -- Add widgets to the wibox
    s.mywibox:setup(
      {
        layout = wibox.layout.align.horizontal,
        -- Left
        {
          layout = wibox.layout.fixed.horizontal,
          mylauncher,
          s.mytaglist,
          s.mypromptbox,
        },
        -- Middle
        {
          layout = wibox.layout.fixed.horizontal,
        },
        -- Right
        {
          layout = wibox.layout.fixed.horizontal,
          awful.widget.watch([[bash -c "echo ' ' 'CPU' $(top -bn1 | grep Cpu | awk '{print $2}')% ' '"]], 1),
          awful.widget.watch([[bash -c "echo ' ' 'RAM' $(echo $(free -h | grep Mem) | awk '{print $3}') ' '"]], 1),
          awful.widget.watch([[bash -c "echo ' ' "MBL" $(echo $(brightnessctl -m -d intel_backlight | awk -F, '{print substr($4, 0, length($4)-1)}')%) ' '"]], 1),
          awful.widget.watch([[bash -c 'echo " " "BAT" $(cat /sys/class/power_supply/BAT1/capacity)% " "']], 180),
          awful.widget.watch([[bash -c 'echo " " "VOL" $(echo $(amixer get Master | grep -E -o "[0-9]{1,3}%")) " "']], 1),
          awful.widget.watch([[bash -c 'echo " " $(date +%Y-%m-%d\ %H:%M) " "']], 60),
          wibox.widget.systray(),
          s.mylayoutbox,
        },
      }
    )
  end
)

---- Mouse Binding
root.buttons(gears.table.join(awful.button({}, 3, function() mymainmenu:toggle() end)))

---- Global Keybinding
local globalkeys = gears.table.join(

  -- GROUP: AWESOME
  awful.key({ modkey, 'Control' }, 'k',
    hotkeys_popup.show_help,
    { description='Show Keybinding Table', group='Awesome' }),
  awful.key({ modkey, 'Shift' }, 'r',
    awesome.restart,
    { description = 'Reload Awesome', group = 'Awesome' }),
  awful.key({ modkey, 'Shift' }, 'e',
    awesome.quit,
    { description = 'Quit Awesome', group = 'Awesome' }),

  -- GROUP: SCREEN
  -- awful.key({ modkey, 'Control' }, ',',
  --   function()
  --     awful.screen.focus_relative(1)
  --   end,
  --   { description = 'focus the next screen', group = 'Screen' }),
  -- awful.key({ modkey, 'Control' }, '.',
  --   function()
  --     awful.screen.focus_relative(-1)
  --   end,
  --   { description = 'focus the previous screen', group = 'Screen' }),

  -- GROUP: LAUNCHER
  awful.key({ modkey }, 'Return',
    function()
      awful.spawn('alacritty')
    end,
    { description = 'Open Terminal', group = 'Launcher' }),
  awful.key({ modkey, 'Shift' }, 'Return',
    function()
      awful.spawn('emacs')
    end,
    { description = 'Open Emacs GUI', group = 'Launcher' }),
  awful.key({ modkey }, 'space',
    function()
      awful.screen.focused().mypromptbox:run()
    end,
    { description = 'Run Prompt', group = 'Launcher' }),
  awful.key({ modkey }, 'x',
    function ()
      awful.prompt.run({
        prompt = 'Run Lua code: ',
        textbox = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. '/history_eval'
      })
    end,
    { description = 'Lua Execute Prompt', group = 'Launcher' }),

  -- GROUP: LAYOUT
  awful.key({ modkey }, 'l',
    function()
      awful.tag.incmwfact(0.05)
    end,
    { description = 'Increase Focused Window Width', group = 'Layout' }),
  awful.key({ modkey }, 'h',
    function()
      awful.tag.incmwfact(-0.05)
    end,
    { description = 'Decrease Focused Window Width', group = 'Layout' }),
  awful.key({ modkey }, 'Tab',
    function() awful.layout.inc(1) end,
    { description = 'Select Next Layout', group = 'Layout' }),

  -- GROUP: TAG
  awful.key({ modkey }, '1',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[1]
      if tag then tag:view_only() end
    end,
    { description = 'View Tag 1', group = 'Tag' }),
  awful.key({ modkey }, '2',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[2]
      if tag then tag:view_only() end
    end,
    { description = 'View Tag 2', group = 'Tag' }),
  awful.key({ modkey }, '3',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[3]
      if tag then tag:view_only() end
    end,
    { description = 'View Tag 3', group = 'Tag' }),
  awful.key({ modkey }, '4',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[4]
      if tag then tag:view_only() end
    end,
    { description = 'View Tag 4', group = 'Tag' }),
  awful.key({ modkey }, '5',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[5]
      if tag then tag:view_only() end
    end,
    { description = 'View Tag 5', group = 'Tag' }),
  awful.key({ modkey }, '6',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[6]
      if tag then tag:view_only() end
    end,
    { description = 'View Tag 6', group = 'Tag' }),
  awful.key({ modkey }, '7',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[7]
      if tag then tag:view_only() end
    end,
    { description = 'View Tag 7', group = 'Tag' }),
  awful.key({ modkey }, '8',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[8]
      if tag then tag:view_only() end
    end,
    { description = 'View Tag 8', group = 'Tag' }),
  awful.key({ modkey }, '9',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[9]
      if tag then tag:view_only()end
    end,
    { description = 'View Tag 9', group = 'Tag' }),
  awful.key({ modkey }, '0',
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[10]
      if tag then tag:view_only() end
    end,
    { description = 'View Tag 0', group = 'Tag' }),

  awful.key({ modkey, 'Shift' }, '1',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[1]
        if tag then client.focus:move_to_tag(tag) end
      end
    end,
    { description = 'Move Focused Window to Tag 1', group = 'Tag' }),
  awful.key({ modkey, 'Shift' }, '2',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[2]
        if tag then client.focus:move_to_tag(tag)end
      end
    end,
    { description = 'Move Focused Window to Tag 2', group = 'Tag' }),
  awful.key({ modkey, 'Shift' }, '3',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[3]
        if tag then client.focus:move_to_tag(tag) end
      end
    end,
    { description = 'Move Focused Window to Tag 3', group = 'Tag' }),
  awful.key({ modkey, 'Shift' }, '4',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[4]
        if tag then client.focus:move_to_tag(tag) end
      end
    end,
    { description = 'Move Focused Window to Tag 4', group = 'Tag' }),
  awful.key({ modkey, 'Shift' }, '5',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[5]
        if tag then client.focus:move_to_tag(tag) end
      end
    end,
    { description = 'Move Focused Window to Tag 5', group = 'Tag' }),
  awful.key({ modkey, 'Shift' }, '6',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[6]
        if tag then client.focus:move_to_tag(tag) end
      end
    end,
    { description = 'Move Focused Window to Tag 6', group = 'Tag' }),
  awful.key({ modkey, 'Shift' }, '7',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[7]
        if tag then client.focus:move_to_tag(tag) end
      end
    end,
    { description = 'Move Focused Window to Tag 7', group = 'Tag' }),
  awful.key({ modkey, 'Shift' }, '8',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[8]
        if tag then client.focus:move_to_tag(tag) end
      end
    end,
    { description = 'Move Focused Window to Tag 8', group = 'Tag' }),
  awful.key({ modkey, 'Shift' }, '9',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[9]
        if tag then client.focus:move_to_tag(tag) end
      end
    end,
    { description = 'Move Focused Window to Tag 9', group = 'Tag' }),
  awful.key({ modkey, 'Shift' }, '0',
    function()
      if client.focus then
        local tag = client.focus.screen.tags[10]
        if tag then client.focus:move_to_tag(tag) end
      end
    end,
    { description = 'Move Focused Window to Tag 0', group = 'Tag' }),

  -- GROUP: Lock
  awful.key({ 'Control', 'Shift', altkey }, 'l',
    function() awful.util.spawn('i3lock') end,
    { description = 'Lock Screen', group = 'Lock'  }),

  -- GROUP: XF86
  awful.key({}, 'XF86MonBrightnessUp',
    function() awful.util.spawn('brightnessctl s +5%') end,
    { description = 'Raise Monitor Backlight', group = 'XF86' }),
  awful.key({}, 'XF86MonBrightnessDown',
    function() awful.util.spawn('brightnessctl s 5%-') end,
    { description = 'Lower Monitor Backlight', group = 'XF86' }),
  awful.key({}, 'XF86AudioRaiseVolume',
    function() awful.util.spawn('amixer set Master 2%+') end,
    { description = 'Raise Volume', group = 'XF86' }),
  awful.key({}, 'XF86AudioLowerVolume',
    function() awful.util.spawn('amixer set Master 2%-') end,
    { description = 'Lower Volume', group = 'XF86' })
)
root.keys(globalkeys)

---- Client & Rule

local clientkeys = gears.table.join(

  -- GROUP: CLIENT
  awful.key({ modkey }, 'j',
    function() awful.client.focus.byidx(1) end,
    { description = 'focus next by index', group = 'Client' }),
  awful.key({ modkey }, 'k',
    function() awful.client.focus.byidx(-1) end,
    { description = 'focus previous by index', group = 'Client' }),
  awful.key({ modkey, 'Shift' }, 'j',
    function() awful.client.swap.byidx(1) end,
    { description = 'Swap With Next Window', group = 'Client' }),
  awful.key({ modkey, 'Shift' }, 'k',
    function() awful.client.swap.byidx(-1) end,
    { description = 'Swap With Previous Window', group = 'Client' }),
  awful.key({ modkey }, 'f',
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = 'Toggle Fullscreen', group = 'Client' }),
  awful.key({ modkey, 'Shift' }, 'q',
    function(c) c:kill() end,
    { description = 'Close Focused Window', group = 'Client' })
)

local clientbuttons = gears.table.join(
  awful.button({}, 1,
    function(c) c:emit_signal('request::activate', 'mouse_click', { raise = true }) end),
  awful.button({ modkey }, 1,
    function(c)
      c:emit_signal('request::activate', 'mouse_click', { raise = true })
      awful.mouse.client.move(c)
    end),
  awful.button({ modkey }, 3,
    function(c)
      c:emit_signal('request::activate', 'mouse_click', { raise = true })
      awful.mouse.client.resize(c)
    end)
)

awful.rules.rules = {
  -- Client Rule
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },

  -- Floating Clients
  {
    rule_any = {
      instance = {
        'DTA',  -- Firefox addon DownThemAll.
        'copyq',  -- Includes session name in class.
        'pinentry',
      },
      class = {
        'Arandr',
        'Blueman-manager',
        'Wpa_gui',
      },
      name = {
        'Event Tester',
      },
      role = {
        'AlarmWindow',
        'ConfigManager',
        'pop-up',
      }
    },
    properties = { floating = true }
  },

  -- Add titlebars to normal clients and dialogs
  {
    rule_any = {
      type = {
        'normal',
        'dialog'
      }
    },
    properties = { titlebars_enabled = true }
  },

  -- Set Firefox to always map on the tag named '2' on screen 1.
  {
    rule = { class = 'Firefox' },
    properties = { screen = 1, tag = '2' }
  },
}

-- [[[ SIGNAL ]]]

-- Signal function to execute when a new client appears.
client.connect_signal('manage',
  function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
    end
  end)

-- Title Bar
client.connect_signal('request::titlebars',

  function(c)
    -- buttons for the titlebar
    -- @REF: https://www.reddit.com/r/awesomewm/comments/61s020/round_corners_for_every_client/
    local buttons = gears.table.join(
      awful.button({}, 1,
        function()
          c:emit_signal('request::activate', 'titlebar', { raise = true })
          awful.mouse.client.move(c)
        end),
      awful.button({}, 3,
        function()
          c:emit_signal('request::activate', 'titlebar', { raise = true })
          awful.mouse.client.resize(c)
        end)
    )

    -- title bar layout
    awful.titlebar(c, { size = 24 }):setup(
      {
        -- Left
        {
          -- Application Icon
          awful.titlebar.widget.iconwidget(c),
          buttons = buttons,
          layout  = wibox.layout.fixed.horizontal
        },
        -- Middle
        {
          {
            -- Title Name
            align  = 'center',
            widget = awful.titlebar.widget.titlewidget(c)
          },
          buttons = buttons,
          layout  = wibox.layout.flex.horizontal
        },
        -- Right
        {
          awful.titlebar.widget.floatingbutton(c),
          awful.titlebar.widget.maximizedbutton(c),
          awful.titlebar.widget.stickybutton(c),
          awful.titlebar.widget.ontopbutton(c),
          awful.titlebar.widget.closebutton(c),
          layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
      }
    )
  end
)

-- Focused with Mouse
client.connect_signal('mouse::enter', function(c) c:emit_signal('request::activate', 'mouse_enter', { raise = false }) end)

-- Window Border Color
client.connect_signal('focus', function(c) c.border_color = beautiful.border_focus end)
client.connect_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)

---- Autostart
awful.spawn.with_shell('xclip')
awful.spawn.with_shell('nm-applet')
awful.spawn.with_shell('flameshot')
-- awful.spawn.with_shell('if pgrep -x "volumeicon" > /dev/null; then killall volumeicon; else volumeicon; fi')
-- awful.spawn.with_shell('xfce4-power-manager')
awful.spawn.with_shell('ibus-daemon -rxdR')
awful.spawn.with_shell('[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources')
-- awful.spawn.with_shell('redshift -l 23.0:120.0 -t 5500:5000 -g 0.9 -m vidmode -o')

---- Prevent Memory Leak
gears.timer({
  timeout = 30,
  autostart = true,
  callback = function() collectgarbage() end
})
