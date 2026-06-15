cask "rustwave" do
  version "0.5.3"

  on_arm do
    sha256 "1f589f10c34f0bb94fb6c20ed708f38375fd251e7f68d8fe82558a011f518582"
    url "https://github.com/IxianPixel/rustwave/releases/download/v#{version}/rustwave-macos-arm-v#{version}.tar.gz"
  end
  on_intel do
    sha256 "a26307fd560faeb85460c69b6f01ee76a08abd05a56058a2a829c4ea2e72a361"
    url "https://github.com/IxianPixel/rustwave/releases/download/v#{version}/rustwave-macos-intel-v#{version}.tar.gz"
  end

  name "Rustwave"
  desc "SoundCloud music player built with Rust and Iced"
  homepage "https://github.com/IxianPixel/rustwave"

  app "Rustwave.app"

  # The app is ad-hoc signed (no Apple Developer ID / notarization),
  # so strip the quarantine flag on install to avoid Gatekeeper
  # blocking launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Rustwave.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.malgra.rustwave",
    "~/Library/Saved Application State/com.rustwave.app.savedState",
  ]
end
