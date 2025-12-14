class TermBeam < Formula
  desc "Terminal chat client - beam messages across the network"
  homepage "https://github.com/orion-supernova/term-beam"
  version "1.0.5"
  license "MIT"

  on_macos do
    url "https://github.com/orion-supernova/term-beam/releases/download/v1.0.5/term-beam-1.0.5.tar.gz"
    sha256 "e46f42463c15eb8fc14a7c641601e38f3ec451d66b9e2cf804f0d0671e0dcb0d"
  end

  on_linux do
    url "https://github.com/orion-supernova/term-beam/releases/download/v1.0.0/term-beam-1.0.0-linux.tar.gz"
    sha256 "REPLACE_WITH_ACTUAL_SHA256_FROM_LINUX_RELEASE"
  end

  def install
    bin.install "term-beam"
  end

  test do
    assert_match "term-beam", shell_output("#{bin}/term-beam --version")
  end
end
