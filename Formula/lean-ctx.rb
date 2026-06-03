class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 67 MCP tools, 10 read modes, 60+ shell patterns"
  homepage "https://leanctx.com"
  version "3.7.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.1/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "c7353c04cfa29615db9a2d8f8f4042743d09da020cd0098cf562d9e325e47dbb"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.1/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "61dccf215f2f95846af76e29ed8ddaa986c7cedd4a62ba40e1bb1098082a32e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.1/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "723c14ea626a8a5c97021a13f941fd39ca1a8da1485d7d492d1327d32983435e"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.1/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a518fc094148d1901260e55dd2e02f137c6e5359f47455a64ad5c465a251b858"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.7.1", shell_output("#{bin}/lean-ctx --version")
  end
end
