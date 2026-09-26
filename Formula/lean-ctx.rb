class LeanCtx < Formula
    desc "The Context Engineering Layer for AI Coding — MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.10.4"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.4/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "949fedc2dacfd89943d3f7e7ba02fe6d1b3619c39a81c9df9d8a608072e60704"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.4/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "27c464100def57cb2c612ec871f1b45b1714672677cf35f23da6e6dabf70cf82"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.4/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "136e41f5e78136b58811988431dedc4ae26ed2866e125bc5a48134e55958e875"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.4/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd70aeb9e7f6ccc0b1f27f0cb4f7d690f8a8581a2e67231817be61624502f5db"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.10.4", shell_output("#{bin}/lean-ctx --version")
  end
end
