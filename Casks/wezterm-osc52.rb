cask "wezterm-osc52" do
  version "20261114-112920-4e6e6f9b-osc52.43"
  # Upstream WezTerm commit: e1eae81a56be8b5487dc77a29616afa568fb57b7
  sha256 "d4db9ad4657f00cd0066031c36499d2de7ecf8304bd272f73f499683d3f318df"

  url "https://github.com/ldelossa/wezterm-osc52/releases/download/#{version}/WezTerm-macos-#{version}.zip"
  name "WezTerm"
  desc "Unofficial WezTerm build with opt-in OSC 52 clipboard querying"
  homepage "https://github.com/ldelossa/wezterm-osc52"

  conflicts_with cask: [
    "wezterm",
    "wezterm@nightly",
  ]
  depends_on macos: :big_sur

  app "WezTerm.app"
  binary "#{appdir}/WezTerm.app/Contents/MacOS/wezterm"
  binary "#{appdir}/WezTerm.app/Contents/MacOS/wezterm-gui"
  binary "#{appdir}/WezTerm.app/Contents/MacOS/wezterm-mux-server"
  binary "#{appdir}/WezTerm.app/Contents/MacOS/strip-ansi-escapes"
  bash_completion "#{appdir}/WezTerm.app/Contents/Resources/shell-completion/bash", target: "wezterm"
  fish_completion "#{appdir}/WezTerm.app/Contents/Resources/shell-completion/fish", target: "wezterm.fish"
  zsh_completion "#{appdir}/WezTerm.app/Contents/Resources/shell-completion/zsh", target: "_wezterm"

  zap trash: "~/Library/Saved Application State/com.github.ldelossa.wezterm-osc52.savedState"

  caveats <<~EOS
    This is an unofficial downstream build and is not affiliated with or
    supported by the upstream WezTerm project.

    OSC 52 clipboard reading remains disabled by default. Enabling
    enable_osc52_clipboard_reading allows terminal applications, including
    applications reached over SSH, to read the host clipboard.
  EOS
end
