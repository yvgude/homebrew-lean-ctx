class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 68 MCP tools, 10 read modes, 60+ shell patterns"
  homepage "https://leanctx.com"
  version "3.7.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.4/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "b3054000b10a9b6a3652c018eeff6a81285b9bcfa6ea1ba0889bed68962433ce"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.4/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "097d8af364704173294dc119c276ddf878b2bbbe8eab0b194ce16137047867f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.4/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b83971ae0eb20c384e2f499fe771b453df0c8cb8f0d2a9aa44cdbaaa5c575a6d"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.4/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "878dff4b243f7022bf27485ae2808a160390c30286502859305e658aad173b51"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.7.4", shell_output("#{bin}/lean-ctx --version")
  end
end
