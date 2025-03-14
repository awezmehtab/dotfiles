Welcome to my `dotfiles` repository. Hopefully this is portable.
To use it, follow these steps:

* If you have previous config files, back them up
* Clone this repository: `gh clone awezmehtab/dotfiles` (preferably at
`~/dotfiles/` idk why).
* `cd` into it.
* Run `stow -D -t $HOME .` - this deletes all dangling symlinks created earlier
* Run `stow -t $HOME .` which installs this new config.
> **NOTE:** This removes all configs initially and the installs. So you might
> need to reload few things (or even restart your system).


> **NOTE:** For `keyd`, you can't run `stow` as this changes keyboard at
> hardware level. Just write the conf files in `/etc/keyd/` and run `sudo
> systemctl restart keyd`.
