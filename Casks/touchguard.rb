cask "touchguard" do
  version "2.0.0"
  sha256 "06e6c61cf5cba2b6e86e6703946826c72cfec74246f59d07cf8e91b34630f886"

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
