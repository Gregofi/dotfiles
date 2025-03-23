# Dotfiles

Currently, we're in a middle of transitioning to NixOS.

## Neovim

Since neovim uses complex configs and whatnot, we just create a symlink to this folder.
It also updates its lazy-lock, so we don't want to just use `.source`, as that creates read-only FS.

## I3

Windows managers are also configured via its config instead of home manager.
Keep it that way unless we move ALL our configs to NixOS (workstation will probably not comply to it).

# TODO

- Try installing NixOS on notebook -> will make sure the config is reusable.
- Modularize the configs into multiple files.
- Migrate to i3 configuration within nix.
- Make separate configuration options for ntb and desktop.

# Old notes

## Sway

We don't use sway right now cause of problems with screensharing in zoom.

### Screensharing

A [checklist](https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist) in case screensharing doesn't work.

