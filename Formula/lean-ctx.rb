class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.20"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.20/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "4828a8408360d8401cfba1b2fbc135af06f06b7388933bbe43a48bb2328a12da"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.20/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "f1e2f401d1722e3c76ed20ff39c6533a10ab97f2021f638b0ce38acc04682a91"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.20/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f4fdf3a38bf904d94b2d9ed9f748f16c6df4b7c160e918d61c9afef1586c070"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.20/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f9a127fb841c36f77a190ec7d2b59b22f8891edb26e6a23515512d8fb0f29ff"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.20", shell_output("#{bin}/lean-ctx --version")
  end
end
