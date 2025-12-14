class ShellStar < Formula
  desc "WebSocket chat server powered by Vapor"
  homepage "https://github.com/YOURUSERNAME/shell-star"
  version "1.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orion-supernova/shell-star/releases/download/v1.0.6/shell-star-1.0.6.tar.gz"
      sha256 "38da201ac87139e1da59c80894d153bdbb36a82a0eeaf48ad0b91a39ddae0653"
    else
      url "https://github.com/YOURUSERNAME/shell-star/releases/download/v1.0.0/shell-star-1.0.0.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FROM_RELEASE"
    end
  end

  on_linux do
    url "https://github.com/YOURUSERNAME/shell-star/releases/download/v1.0.0/shell-star-1.0.0-linux.tar.gz"
    sha256 "REPLACE_WITH_ACTUAL_SHA256_FROM_LINUX_RELEASE"
  end

  def install
    bin.install "shell-star"
  end

  test do
    # Test that the binary exists and is executable
    system "#{bin}/shell-star", "--help"
  end
end
