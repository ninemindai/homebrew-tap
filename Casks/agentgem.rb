cask "agentgem" do
  version "0.10.4"

  on_arm do
    sha256 "26204e34490ce50b3d51d1ca737e45387c79343d1df084ef2c23dc1e2f8c13bd"

    url "https://github.com/ninemindai/agentgem/releases/download/desktop-v#{version}/AgentGem-#{version}-arm64.dmg",
        verified: "github.com/ninemindai/agentgem/"
  end
  on_intel do
    sha256 "8cf043aabd7926b7266bc4d7f1dc0d6a6ba5e53bf98b62b1b61c488f7abbad82"

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
