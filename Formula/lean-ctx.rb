class LeanCtx < Formula
    desc "The Context Engineering Layer for AI Coding — MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.10.1"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.1/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "25a14a6bc597739c8f5e8a8d18e85e38f89711e4fcb82bdd648b060d201360fd"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.1/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "b062d377b07f0645097f81471fc08468cd47cfb390b2058f9cb201135dfda19e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.1/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7bb3c5f306276d4dc8e769de0aa771827c030077ac892980ab6c50129809a9b5"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.1/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dae5bde18c58b7976b98f967f261bbdece8d3072dda23e6509f3da7d581b5c58"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.10.1", shell_output("#{bin}/lean-ctx --version")
  end
end
