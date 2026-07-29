class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.13"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.13/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "12c02064880ab62f159844624fa36dfa756f98a7651bbf482e216b7ae0d7db56"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.13/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "3cf6a2818528dc39d5e92d7cb5aee40baa783c165d8690b2df9956c3b29101c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.13/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "446705753af0828c2d08fbe5f5896dc01964fadfa047ce8c685ff9c69459f3b9"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.13/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8db4d2f99810cd4128c35d40cf73fffff8783fa5bf25a1b335ecc7495eca84b5"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.13", shell_output("#{bin}/lean-ctx --version")
  end
end
