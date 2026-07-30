# Homebrew tap for WezTerm OSC52

This tap distributes the unofficial macOS build from
[`ldelossa/wezterm-osc52`](https://github.com/ldelossa/wezterm-osc52).
It is not affiliated with or supported by the upstream WezTerm project.

## Install

```bash
brew install --cask ldelossa/wezterm-osc52/wezterm-osc52
```

The cask installs the drop-in application name `WezTerm.app` and the normal
WezTerm command names. It conflicts with the upstream `wezterm` and
`wezterm@nightly` casks.

## OSC 52 clipboard reads

Clipboard reading is disabled by default. Read the downstream
[security documentation](https://github.com/ldelossa/wezterm-osc52/blob/main/README-OSC52.md)
before enabling `enable_osc52_clipboard_reading`.

## Releases

Every cask version refers to one immutable GitHub Release ZIP and exact SHA-256
checksum. Release provenance is embedded in
`WezTerm.app/Contents/Resources/wezterm-osc52-release.json`.
