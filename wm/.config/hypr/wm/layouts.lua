hl.config({
    dwindle = {
        preserve_split = true
    },
    master = {
        new_status = "master",
        -- TODO: should work, have to debug
        -- focus_master_on_close = true,
    },
    scrolling = {
        fullscreen_on_one_column = true,
        wrap_focus = false,
        column_width = 1.0
    },
})
