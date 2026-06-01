class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 67 MCP tools, 10 read modes, 60+ shell patterns"
  homepage "https://leanctx.com"
  version "3.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.0/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "952f60da2c75e20790143a6ffc3bb400b726679bfa0d3cb5399621408572f99d"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.0/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "ffb1f4b604d2979390da48c2d0a7aa709444144277f3ebb75584e7ffea9061eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.0/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf2132b0b2b43497f1e9709635445f02b4295b9908558e09b2c236c9888e0901"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.0/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c76a90821d94a9d52e03f02c74d88aa5aafe7acc31773307068648b722dc9b0"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.7.0", shell_output("#{bin}/lean-ctx --version")
  end
end
