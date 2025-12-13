class TermBeam < Formula
  desc "Terminal chat client - beam messages across the network"
  homepage "https://github.com/orion-supernova/term-beam"
  version "1.0.4"
  license "MIT"

  on_macos do
    url "https://github.com/orion-supernova/term-beam/releases/download/v1.0.4/term-beam-1.0.4.tar.gz"
    sha256 "f43be83ea6173e0834492a7ea21688f1059aafde205fb24c1358a2295ed62ee0"
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
