cask "wezterm-osc52" do
  version "20260911-044256-5cbc3ccf-osc52.29"
  # Upstream WezTerm commit: 2b56c4688f05823bde528d6b7f95b9094921337a
  sha256 "8a1e8b708ecce640bdec122975c324f6f39ef1da23c1b4b3918f4160b08d1394"

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
