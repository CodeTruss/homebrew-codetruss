# CodeTruss Homebrew tap

This is the official Homebrew tap for the CodeTruss CLI, the deterministic
first-pass verification gate for AI-written code. It binds an agent task to the
final Git diff, runs 13 deterministic analyzers and your repository
verification commands, and writes a verifiable PASS, REVIEW_REQUIRED, or FAILED
receipt.

> **This repository is updated by release automation.** `Formula/codetruss.rb` is
> bumped to each new CodeTruss CLI release as part of the release process, so hand
> edits to the formula's `url` and `sha256` are overwritten by the next release.
> Development happens in the private CodeTruss monorepo. Please open pull requests
> and issues there instead.

## Install

Homebrew 6 requires trust for software from third-party taps. Installing the
fully qualified formula trusts only this formula, not every package the tap may
contain:

```sh
brew install DeliriumPulse/codetruss/codetruss
codetruss --version
```

To upgrade or uninstall:

```sh
brew upgrade codetruss
brew uninstall codetruss
```

At the Git root, run the guided setup once:

```sh
cd /path/to/repository
codetruss setup
```

`setup` proposes a narrow scope, detects the repository's existing verification
commands, shows their exact fingerprint before trust, installs the hooks you
select, and runs diagnostics. After that, keep using your coding agent normally.

To review an existing change directly:

```sh
codetruss review --task "Review my current agent changes"
codetruss verify latest
```

Deterministic analysis and receipts stay on your machine. `--llm` is opt-in and
uses your selected provider credentials; only an explicit `codetruss sync`
uploads a receipt to CodeTruss. See the full [CLI documentation](https://codetruss.com/cli).

## Integrity and release policy

The formula downloads one immutable, versioned archive from the official
[`DeliriumPulse/codetruss-cli`](https://github.com/DeliriumPulse/codetruss-cli)
release. Its SHA-256 is pinned in the formula. Pull requests run formula style,
audit, install, and functional tests on supported macOS runners before merge.

Do not update only the version or URL. Every release change must update the URL,
SHA-256, and formula test together and must point to a published, immutable
CodeTruss release.

## Licensing boundary

The files in this tap repository are MIT-licensed. The CodeTruss CLI downloaded
by the formula is proprietary, free-to-use software governed by the license
inside the release archive and the [CodeTruss Terms](https://codetruss.com/terms).
The tap license does not relicense the CLI. See [NOTICE.md](NOTICE.md).

## Support and security

- Installation or formula issue: [open a tap issue](https://github.com/DeliriumPulse/homebrew-codetruss/issues)
- CLI issue: [open a CLI issue](https://github.com/DeliriumPulse/codetruss-cli/issues)
- Security report: follow the private reporting instructions in [SECURITY.md](SECURITY.md)
