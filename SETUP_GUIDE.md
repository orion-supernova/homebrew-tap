# Homebrew Tap Setup Guide

Complete guide to publishing **term-beam** and **shell-star** on Homebrew.

## Prerequisites

- GitHub account
- Both projects pushed to separate GitHub repositories
- Git installed locally

## Step-by-Step Setup

### 1. Create GitHub Repositories

Create three separate repositories on GitHub:

1. **term-beam** - Your client project (rename ChatClient repo)
2. **shell-star** - Your server project (rename testVapor repo)
3. **homebrew-tap** - Your Homebrew tap (this directory)

### 2. Prepare Your Projects

#### For term-beam repository:

```bash
cd /Users/muratcankoc/Documents/Projects/Backend/ChatClient

# Initialize git if not already done
git init
git add .
git commit -m "Initial commit: term-beam v1.0.0"

# Add your GitHub remote (replace YOURUSERNAME)
git remote add origin https://github.com/YOURUSERNAME/term-beam.git
git branch -M main
git push -u origin main

# Create first release tag
git tag v1.0.0
git push origin v1.0.0
```

The GitHub Action will automatically build and create a release!

#### For shell-star repository:

```bash
cd /Users/muratcankoc/Documents/Projects/Backend/testVapor

# Initialize git if not already done
git init
git add .
git commit -m "Initial commit: shell-star v1.0.0"

# Add your GitHub remote (replace YOURUSERNAME)
git remote add origin https://github.com/YOURUSERNAME/shell-star.git
git branch -M main
git push -u origin main

# Create first release tag
git tag v1.0.0
git push origin v1.0.0
```

### 3. Create Homebrew Tap Repository

**IMPORTANT**: The repository MUST be named `homebrew-tap` or `homebrew-SOMETHING`.

```bash
cd /Users/muratcankoc/Documents/Projects/Backend/homebrew-tap

git init
git add .
git commit -m "Initial tap setup"

# Add your GitHub remote (replace YOURUSERNAME)
git remote add origin https://github.com/YOURUSERNAME/homebrew-tap.git
git branch -M main
git push -u origin main
```

### 4. Update Formula Files with Real SHA256

After the GitHub Actions finish building releases:

1. Go to your releases:
   - https://github.com/YOURUSERNAME/term-beam/releases/tag/v1.0.0
   - https://github.com/YOURUSERNAME/shell-star/releases/tag/v1.0.0

2. Download the `.sha256` files or compute checksums:

```bash
# Get SHA256 for macOS
curl -L https://github.com/YOURUSERNAME/term-beam/releases/download/v1.0.0/term-beam-1.0.0.tar.gz | shasum -a 256

# Get SHA256 for Linux
curl -L https://github.com/YOURUSERNAME/term-beam/releases/download/v1.0.0/term-beam-1.0.0-linux.tar.gz | shasum -a 256
```

3. Edit `Formula/term-beam.rb` and replace:
   - `YOURUSERNAME` with your actual GitHub username
   - `REPLACE_WITH_ACTUAL_SHA256_FROM_RELEASE` with the actual SHA256
   - `REPLACE_WITH_ACTUAL_SHA256_FROM_LINUX_RELEASE` with the Linux SHA256

4. Do the same for `Formula/shell-star.rb`

5. Commit and push:

```bash
git add Formula/
git commit -m "Update formulae with release checksums"
git push
```

### 5. Test Your Tap Locally

```bash
# Add your tap
brew tap YOURUSERNAME/tap

# Install term-beam
brew install term-beam

# Test it
term-beam --version

# Install shell-star
brew install shell-star

# Test it
shell-star --help
```

### 6. Update README Files

Update the `README.md` files in all three repositories to replace `YOURUSERNAME` with your actual GitHub username.

## Future Releases

To release a new version:

### Option 1: Manual Release

```bash
cd /path/to/term-beam  # or shell-star

# Update version in Package.swift if needed
# Update version in Application.swift (for term-beam) or entrypoint.swift (for shell-star)

git add .
git commit -m "Bump version to 1.1.0"
git tag v1.1.0
git push origin main
git push origin v1.1.0
```

GitHub Actions will automatically:
- Build for macOS (universal binary)
- Build for Linux
- Create GitHub release with binaries
- Generate SHA256 checksums

Then update your Homebrew formula:

```bash
cd homebrew-tap

# Edit Formula/term-beam.rb:
# - Update version to "1.1.0"
# - Update URLs to v1.1.0
# - Update SHA256 checksums

git add Formula/term-beam.rb
git commit -m "Update term-beam to 1.1.0"
git push
```

Users can then update with:

```bash
brew update
brew upgrade term-beam
```

### Option 2: Automated Formula Updates

You can add a GitHub Action to automatically update formulas when a new release is created. Let me know if you want this!

## Troubleshooting

### Build fails on Linux

Make sure you're using Swift 6.0 compatible syntax. Check the GitHub Actions logs.

### Homebrew can't find formula

Make sure:
- Repository is named `homebrew-tap` (or `homebrew-SOMETHING`)
- Formula files are in `Formula/` directory
- Formula class names match the filename (TermBeam for term-beam.rb)

### SHA256 mismatch

Download the release file and compute SHA256:

```bash
curl -L https://github.com/YOURUSERNAME/term-beam/releases/download/v1.0.0/term-beam-1.0.0.tar.gz -o term-beam.tar.gz
shasum -a 256 term-beam.tar.gz
```

Update the formula with the correct checksum.

## Additional Features

### Add Completions

You can add shell completions to your formulae. Let me know if interested!

### Add Caveats

Add post-install messages to formulas:

```ruby
def caveats
  <<~EOS
    To start the server:
      shell-star

    To connect with client:
      term-beam
  EOS
end
```

### Add Dependencies

If you need system dependencies:

```ruby
depends_on "openssl"
depends_on "sqlite"
```

## Publishing to Official Homebrew

If your tools become popular, you can submit them to:
- **homebrew-core** (main tap, strict requirements)
- **homebrew-cask** (for GUI apps)

Requirements for homebrew-core:
- 75+ stars on GitHub
- 30+ watchers
- Active maintenance
- Good documentation

## Questions?

Open an issue in the homebrew-tap repository!
