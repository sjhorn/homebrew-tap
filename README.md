# sjhorn/homebrew-tap

Homebrew casks for apps by Scott Horn.

```sh
brew install --cask sjhorn/tap/touchguard
```

| Cask | App |
|------|-----|
| `touchguard` | [TouchGuard](https://touchguard.hornmicro.com/): blocks accidental trackpad clicks while typing. Also installs the `touchguard` command-line tool. |

TouchGuard updates itself (Sparkle), so `brew upgrade` skips it unless you pass `--greedy`. The cask is updated automatically once a day after a new [release](https://github.com/sjhorn/TouchGuard/releases). Run the **Update casks** workflow to update it straight away.

Uninstall: `brew uninstall --cask touchguard`. Add `--zap` to also remove its preferences.
