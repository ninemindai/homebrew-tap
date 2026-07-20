cask "agentgem" do
  version "0.8.0"

  on_arm do
    sha256 "83eb6dc790c0ca5827e62e991b2cb2dd1aaef77ead59553e78da9d8c666916dd"

    url "https://github.com/ninemindai/agentgem/releases/download/desktop-v#{version}/AgentGem-#{version}-arm64.dmg",
        verified: "github.com/ninemindai/agentgem/"
  end
  on_intel do
    sha256 "383455eaa25f25527bf701a7fc815d1d26eea542082ba3ec3ddef11f1657968a"

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
