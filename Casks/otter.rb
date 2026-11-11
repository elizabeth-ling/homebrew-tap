cask "otter" do
  version "1.1.0"
  sha256 "67e6b73e696ac00ab2e834b7ee42ead7ab7a5e5725ae9b5674e8ca03269aba15"

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
