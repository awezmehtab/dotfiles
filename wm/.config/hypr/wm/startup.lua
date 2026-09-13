hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

hl.on("hyprland.start", function ()
  hl.exec_cmd("waybar & hyprpaper & dunst")
end)

hl.config({
  ecosystem = {
    enforce_permissions = true,
  },
})
