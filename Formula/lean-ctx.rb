class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.2/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "9b9610642404b7dd9f35d50aacc72d47c0bfc8a1282dcb83d4b63fbeeac64688"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.2/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "787835935601f0f847c5c70c3d2ec8505e7b4920b02f00afcafa416aebc11da8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.2/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "213fe2170487062e10d2887fbb137f781323c2a3e0cabd2d8e66a5278c656f6c"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.2/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1660abc4abc01421644b9745c8b0f92e2b3d6ce1f02e8c244dee5d2d7d7c4008"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.2", shell_output("#{bin}/lean-ctx --version")
  end
end
