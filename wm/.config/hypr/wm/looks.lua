hl.config({
    general = {
        border_size = 2,

        col = {
            active_border = {
                colors = {"rgba(33ccffee)", "rgba(00ff99ee)"},
                angle  = 45
            },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,
        layout = "scrolling",
    },

    decoration = {
        rounding       = 5,
        rounding_power = 2,

        shadow = { enabled = true },

        blur = {
            enabled   = true,
            size      = 3
        },
    },

    animations = {
        enabled = true,
    },
})
