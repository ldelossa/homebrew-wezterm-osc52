cask "wezterm-osc52" do
  version "20260804-071252-971b8952-osc52.4"
  # Upstream WezTerm commit: 4af230bc01115c7354f0479dd97eec2b5cf62e1d
  sha256 "5b23f3778342c71d59dfe9799e61038c5e22a5511a29ef58ecf3f598bb2ae3d8"

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
