Welcome to my `dotfiles` repository. Hopefully this is portable.
To use it, follow these steps:
* Clone this repository: `gh clone awezmehtab/dotfiles` (preferably at
`~/dotfiles/` idk why).
* `cd` into it.
* Run `stow -t ~ R <whatever configs you want>`

This will create a symlink from `~/dotfiles/X/.config/X` to `~/.config/X` where
`X` is the config you wanted.

[NOTE]
For `keyd`, you can't run `stow` as this changes keyboard at hardware level.
Just write the conf files in `/etc/keyd/` and run `sudo systemctl restart keyd`.
