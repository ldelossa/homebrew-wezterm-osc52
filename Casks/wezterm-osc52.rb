cask "wezterm-osc52" do
  version "20261120-031741-7a002c65-osc52.44"
  # Upstream WezTerm commit: cca5700f380f2a844d52d4345e08f89c6603aa45
  sha256 "d87bdf351cbbd9d0bc41511488a59dd42b6ab61c0fa10a66b59806560e92024c"

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
