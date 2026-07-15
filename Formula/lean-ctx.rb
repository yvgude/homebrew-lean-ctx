class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.6"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.6/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "6069d3fed11de76b414feba195fc5613bd13cb535cb91fb5d9ad0db414011ca4"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.6/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "7eefa986b061e67c44a373daed3864c7ca13df411d18adf71fc3cf007f5fe55a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.6/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "78cadade0e549e040ee1e9ab7aa2bde917980e6d5b6aa9040733c67837dc7a65"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.6/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f648371dc0053852c5ecd7b93a4cb8439667a58c96c8b56874ea2442e6f0bb47"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.6", shell_output("#{bin}/lean-ctx --version")
  end
end
