# Chatra extras

`omarchy theme install` clones this repo and applies colour files. It drops Lua,
terminal configs, and `vscode.json` (Omarchy regenerates those from
`colors.toml`). Everything in this folder is optional.

## Parasol motion (`hyprland.lua`)

Window open/close, spinning wine→indigo→forest borders, glow, blur, and dim.
Only used if Chatra is a **hand-written** theme (no `.git` in the theme
directory). Copy `hyprland.lua` to `~/.config/omarchy/themes/chatra/` on a
local fork that is not a git clone, then `omarchy theme set chatra`.

## Screensaver & fastfetch branding

```sh
omarchy hook install theme-set ~/.config/omarchy/themes/chatra/extras/hooks/theme-set-chatra-branding
omarchy theme set chatra
```

Applying Chatra then swaps fastfetch to a dharmachakra and the screensaver
to a Mekong night: Đông Sơn sun-star, a nāga, Angkor Wat, a lotus, That
Luang with a chatra on the spire, and a nón lá on the river. Leaving the
theme restores whatever you had before.

## Gallery thumbnail

`gallery/chatra.webp` is a 1200px shot for an
[omarchy.org/themes](https://omarchy.org/themes/) pull request
(`assets/themes/chatra.webp` in [omacom/omarchy-site](https://github.com/omacom/omarchy-site)).
