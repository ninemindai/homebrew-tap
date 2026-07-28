cask "agentgem" do
  version "0.9.0"

  on_arm do
    sha256 "ea7750eaa5a465e2e8cc659f9bf8b63bafb5307524216f98cef823ba118eeb46"

    url "https://github.com/ninemindai/agentgem/releases/download/desktop-v#{version}/AgentGem-#{version}-arm64.dmg",
        verified: "github.com/ninemindai/agentgem/"
  end
  on_intel do
    sha256 "831668fca30f1576f6de40b94c69c09d24b38012f24e0060b331fea0a44a9538"

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
