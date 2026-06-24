class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.12"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.12/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "f337ef9638a95c0cd96ba77532c8bec82f3b0be94ca62534c7b514527e4ebe56"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.12/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "608f61888669f5aed3a6fbd0e5a2f452acda59d6a22e7185e6d163f0a3e83cfe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.12/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7881fa92b818d852766ae689eb2e3217655af21c8246bc32191bd67aa05c14ed"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.12/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "edab3de63879a0ab4a9324c9e70973f46d7cbf4242f3eb54ca6534b043ad8afa"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.12", shell_output("#{bin}/lean-ctx --version")
  end
end
