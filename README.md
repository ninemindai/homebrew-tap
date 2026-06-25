# ninemindai/homebrew-tap

Homebrew tap for [AgentGem](https://agentgem.ninemind.ai) — turn your coding-agent
config into secret-safe, composable Gems.

## Install the desktop app

```bash
brew install --cask ninemindai/tap/agentgem
```

That taps this repo and installs **AgentGem.app** to `/Applications`. Update and
uninstall the usual way:

```bash
brew upgrade --cask agentgem
brew uninstall --cask agentgem      # add --zap to also remove app data
```

### First launch (unsigned build)

AgentGem isn't code-signed/notarized yet, so macOS may block the first launch.
Either right-click the app → **Open**, or install without the quarantine flag:

```bash
brew install --cask --no-quarantine ninemindai/tap/agentgem
```

## What's in here

- [`Casks/agentgem.rb`](Casks/agentgem.rb) — the cask (macOS Apple Silicon + Intel).
- [`.github/workflows/update-cask.yml`](.github/workflows/update-cask.yml) — keeps
  the cask in sync with the latest `desktop-v*` release on
  [ninemindai/agentgem](https://github.com/ninemindai/agentgem) (daily + manual).

Prefer not to install an app? The CLI needs no download: `npx @ninemind/agentgem`.
