class TermBeam < Formula
  desc "Terminal chat client - beam messages across the network"
  homepage "https://github.com/YOURUSERNAME/term-beam"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/YOURUSERNAME/term-beam/releases/download/v1.0.0/term-beam-1.0.0.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FROM_RELEASE"
    else
      url "https://github.com/YOURUSERNAME/term-beam/releases/download/v1.0.0/term-beam-1.0.0.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FROM_RELEASE"
    end
  end

  on_linux do
    url "https://github.com/YOURUSERNAME/term-beam/releases/download/v1.0.0/term-beam-1.0.0-linux.tar.gz"
    sha256 "REPLACE_WITH_ACTUAL_SHA256_FROM_LINUX_RELEASE"
  end

  def install
    bin.install "term-beam"
  end

  test do
    assert_match "term-beam", shell_output("#{bin}/term-beam --version")
  end
end
