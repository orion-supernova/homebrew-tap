# Homebrew Tap for term-beam and shell-star

This is a custom Homebrew tap for **term-beam** (terminal chat client) and **shell-star** (WebSocket chat server).

## Installation

First, tap this repository:

```bash
brew tap YOURUSERNAME/tap
```

Then install either or both applications:

```bash
# Install the chat client
brew install term-beam

# Install the chat server
brew install shell-star

# Or install both at once
brew install term-beam shell-star
```

## Usage

### term-beam (Client)

Connect to a chat server:

```bash
# Interactive mode (will prompt for server)
term-beam

# Connect to specific server
term-beam --server chat.example.com:3169
```

### shell-star (Server)

Start the chat server:

```bash
# Will prompt for port (default: 3169)
shell-star
```

## Quick Start

Run these in separate terminals:

```bash
# Terminal 1: Start the server
shell-star

# Terminal 2: Connect with client
term-beam
```

## Updating

To update to the latest version:

```bash
brew update
brew upgrade term-beam shell-star
```

## Uninstall

```bash
brew uninstall term-beam shell-star
brew untap YOURUSERNAME/tap
```

## About

- **term-beam**: Terminal chat client built with Swift, WebSocketKit, and ArgumentParser
- **shell-star**: WebSocket chat server built with Swift and Vapor framework
- Both support macOS and Linux
- Default port: 3169

## License

MIT
