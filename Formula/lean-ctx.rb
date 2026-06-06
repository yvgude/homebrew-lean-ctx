class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 69 MCP tools, 10 read modes, 60+ shell patterns"
  homepage "https://leanctx.com"
  version "3.7.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.5/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "bfa57fb733396de827eb0f78243bfe8fae2455267d4f11311ff35d4318e23d77"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.5/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "6f4751bc62d4a72de33c7fe4ff10361ae7cea9a4c86dbce1063d74f9ba53b536"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.5/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04e97dc7d1fb71f6de89618c4dc90495e41ede5f7c7a0ae50622a318ea5ab3d9"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.5/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c586afe64114142bae360b5c27f3618d2fbe4f82ba4b3e0642096f33b268e4d3"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.7.5", shell_output("#{bin}/lean-ctx --version")
  end
end
