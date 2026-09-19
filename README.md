To use any section of my config (eg. apps), run this from repo root:
```bash
stow -R -t ~ apps
```

## Firefox

You need to set `toolkit.legacyUserProfileCustomizations.stylesheets` to true
from `about:config`, else this is ignored. find profile dir via `about:support`
in firefox. And then symlink this there, eg:

```bash
ln -s ~/.mozilla/firefox/chrome <profile_dir>
```
