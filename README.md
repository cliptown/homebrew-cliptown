# Homebrew Tap for ClipTown

This repository will publish the signed ClipTown CLI and desktop application after their release workflows produce immutable versioned archives and SHA-256 checksums.

## Planned installation

```sh
brew tap cliptown/cliptown
brew install cliptown
```

No formula or cask is published yet. Do not add one that references `latest`, a branch archive, an unsigned binary, or an artifact without a verified checksum.

## Release prerequisite

1. The corresponding source PR is merged into `main`.
2. A semantic version tag creates signed/checksummed release assets.
3. Asset URLs are immutable and publicly downloadable.
4. Formula or cask changes pass `brew audit --strict`, `brew style`, and install tests on supported macOS runners.

## Offline checksum preflight

Once a signed, immutable release archive has been produced, verify its
SHA-256 before writing a Homebrew formula:

```bash
bash scripts/verify-release-checksum.sh /path/to/archive.tar.gz <64-character-lowercase-sha256>
```

The script never downloads binaries, trusts floating URLs, or verifies signing
identity. Signing provenance must be reviewed separately before publication.
