class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.15"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.15/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "2c2a1390807d39149b3a826bb24592bafbbe7cbaab6cc801f8bc60aa711943d9"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.15/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "ee6f42a24ab4bf07a8e002011b9168299a5097c861d88461724880c25cd87846"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.15/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d6390aaa9b09ab56ade7bbfc1e0762af48e4e079590c0676bcdb7c609bcee08"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.15/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04a2d5b4a53265622fc456c653771186b290da7127b3785ee692349e214bfa79"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.15", shell_output("#{bin}/lean-ctx --version")
  end
end
