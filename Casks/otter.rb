cask "otter" do
  version "0.3.0"
  sha256 "79a8be8f323352777cd718a242b3230507f1ddd42f7fcf9c6b8c69a819bbc0f6"

  url "https://github.com/elizabeth-ling/otter/releases/download/v#{version}/Otter-#{version}.dmg"
  name "Otter"
  desc "Menu bar quick capture into Obsidian or any folder"
  homepage "https://github.com/elizabeth-ling/otter"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Sparkle updates the app in place.
  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Otter.app"

  uninstall quit: "io.github.elizabeth-ling.otter"

  # The outbox under Application Support may hold notes not yet delivered.
  zap trash: [
    "~/Library/Application Support/Otter",
    "~/Library/Caches/io.github.elizabeth-ling.otter",
    "~/Library/HTTPStorages/io.github.elizabeth-ling.otter",
    "~/Library/Preferences/io.github.elizabeth-ling.otter.plist",
  ]
end
