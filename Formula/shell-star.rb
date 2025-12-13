class ShellStar < Formula
  desc "WebSocket chat server powered by Vapor"
  homepage "https://github.com/YOURUSERNAME/shell-star"
  version "1.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/orion-supernova/shell-star/releases/download/v1.0.5/shell-star-1.0.5.tar.gz"
      sha256 "df8d33dc2d01414861bdb5ec017a9e6d6a8c704d4f043cf204ec5b25258b535a"
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
