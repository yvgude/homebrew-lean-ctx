class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.1/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "417c90d908322fa7ac5b1aef0088898c1cfe8ab709219b0cc622f5e3a0138e91"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.1/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "c14c0b140e70f8f753ccb26f654c21b55564faa9601b741f87310c1475d389af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.1/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2fa81280fe2c61ba366a91261d7bf52d8e57dd8784e65b4887acb336ef5530f6"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.1/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de9ed864c2bee388ff99d716b3c7f500b37e84f423f11d917069f3fcc42a2f65"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.1", shell_output("#{bin}/lean-ctx --version")
  end
end
