cask "touchguard" do
  version "2.0.2"
  sha256 "69e05f09b5d0265e37154bfa80cdad49987358e5f7131ac01c47d8acff35b41d"

  url "https://github.com/sjhorn/TouchGuard/releases/download/v#{version}/TouchGuard-#{version}.dmg"
  name "TouchGuard"
  desc "Blocks accidental trackpad clicks while typing"
  homepage "https://blog.hornmicro.com/TouchGuard/"

  livecheck do
    url "https://blog.hornmicro.com/TouchGuard/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "TouchGuard.app"
  binary "#{appdir}/TouchGuard.app/Contents/Helpers/touchguard"

  uninstall quit: "com.hornmicro.TouchGuard"

  zap trash: [
    "~/Library/Caches/com.hornmicro.TouchGuard",
    "~/Library/HTTPStorages/com.hornmicro.TouchGuard",
    "~/Library/Preferences/com.hornmicro.TouchGuard.plist",
  ]

  caveats <<~EOS
    TouchGuard needs Accessibility permission to hold back clicks after typing.
    It never reads what you type. Open it once from Applications and follow the
    permission window. Help: https://blog.hornmicro.com/TouchGuard/support/
  EOS
end
