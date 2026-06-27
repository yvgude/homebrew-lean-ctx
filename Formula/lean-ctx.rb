class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.15"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.15/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "14dca9be6bc3357268b01e6e7ba43101fd7bb5fd63b76104f3f165e195bb2bee"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.15/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "83da856a7f800e9269862ab9ee9170db92412c786d7469dd003f8c0341f52b35"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.15/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d58f8feecc7c54570874978c877bf607c0baeb5a6668ad43d76814805c7ef970"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.15/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e652baacfb1da749269e59037d1b7f8dad36466581ebed6ebbe950258a6dd5a0"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.15", shell_output("#{bin}/lean-ctx --version")
  end
end
