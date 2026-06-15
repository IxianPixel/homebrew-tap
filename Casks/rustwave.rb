cask "rustwave" do
  version "0.5.1"

  on_arm do
    sha256 "5672ffa3fd77a5c6c79f6f41455434ad5ba71c774ea6e92be31bb4af45aaa0c6"
    url "https://github.com/IxianPixel/rustwave/releases/download/v#{version}/rustwave-macos-arm-v#{version}.tar.gz"
  end
  on_intel do
    sha256 "aeb3173d1d6af4eafe3bd7eef96deca5f142bd662bc594266310c9ae6bc94171"
    url "https://github.com/IxianPixel/rustwave/releases/download/v#{version}/rustwave-macos-intel-v#{version}.tar.gz"
  end

  name "Rustwave"
  desc "SoundCloud music player built with Rust and Iced"
  homepage "https://github.com/IxianPixel/rustwave"

  app "Rustwave.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Rustwave.app"]
  end
end
