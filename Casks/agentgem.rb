cask "agentgem" do
  version "0.5.0"

  on_arm do
    sha256 "469e8cafbf20dc78ed8c6db0708907c12583e3880a139cbabe691d9a4102529b"

    url "https://github.com/ninemindai/agentgem/releases/download/desktop-v#{version}/AgentGem-#{version}-arm64.dmg",
        verified: "github.com/ninemindai/agentgem/"
  end
  on_intel do
    sha256 "6880110f19521933b100f3dd2ce03e4d7badb7d6f10aa49ba0b9eee041c4f45b"

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
