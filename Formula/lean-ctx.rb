class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.14"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.14/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "2deeac199391bb12d310950d67e6650943c976a6ff17a3190e10803a5640e827"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.14/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "aae5e00600c3466a855ad85bf9b9a497c257326cf8a04898781c69a58eedb2c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.14/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f97661033b79b520a9d9b9fd4510dfeec01d9ea42dae7ecbfbf3c5cf7970123"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.14/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "07e8ccf86879c18d2a7f446113fd408702ae435f3be99c7b3f9b91d1fda2afea"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.14", shell_output("#{bin}/lean-ctx --version")
  end
end
