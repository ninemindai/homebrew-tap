cask "agentgem" do
  version "0.4.1"

  on_arm do
    sha256 "eb16db2d3ead5d5d846e193cafaf1af1ccbd3aa0148afac5baede36280858913"

    url "https://github.com/ninemindai/agentgem/releases/download/desktop-v#{version}/AgentGem-#{version}-arm64.dmg",
        verified: "github.com/ninemindai/agentgem/"
  end
  on_intel do
    sha256 "f60faa974f44c7a14c96eae6744cfcad70f922b4e8502de584f898dad34abfee"

    url "https://github.com/ninemindai/agentgem/releases/download/desktop-v#{version}/AgentGem-#{version}.dmg",
        verified: "github.com/ninemindai/agentgem/"
  end

  name "AgentGem"
  desc "Desktop app for building secret-safe, composable Gems from your coding-agent config"
  homepage "https://agentgem.ninemind.ai/"

  livecheck do
    url "https://github.com/ninemindai/agentgem/releases"
    regex(/desktop-v(\d+(?:\.\d+)+)/i)
    strategy :page_match
  end

  app "AgentGem.app"

  zap trash: [
    "~/.agentgem",
    "~/Library/Application Support/AgentGem",
    "~/Library/Preferences/ai.ninemind.agentgem.plist",
    "~/Library/Saved Application State/ai.ninemind.agentgem.savedState",
  ]

  caveats <<~EOS
    AgentGem is not yet code-signed or notarized. If macOS blocks the first
    launch, either right-click the app and choose Open, or install with:
      brew install --cask --no-quarantine ninemindai/tap/agentgem
  EOS
end
