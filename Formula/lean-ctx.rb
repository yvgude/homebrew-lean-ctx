class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 67 MCP tools, 10 read modes, 60+ shell patterns"
  homepage "https://leanctx.com"
  version "3.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.1/lean-ctx-3.7.1-source.tar.gz"
      sha256 "860cc35c0950c2c0f0dad23c85c76b2e86e53e8b682a67662240c436855587e6"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.1/lean-ctx-3.7.1-source.tar.gz"
      sha256 "860cc35c0950c2c0f0dad23c85c76b2e86e53e8b682a67662240c436855587e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.1/lean-ctx-3.7.1-source.tar.gz"
      sha256 "860cc35c0950c2c0f0dad23c85c76b2e86e53e8b682a67662240c436855587e6"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.1/lean-ctx-3.7.1-source.tar.gz"
      sha256 "860cc35c0950c2c0f0dad23c85c76b2e86e53e8b682a67662240c436855587e6"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.7.1", shell_output("#{bin}/lean-ctx --version")
  end
end
