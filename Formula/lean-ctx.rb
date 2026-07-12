class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.8"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.8/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "d6193d0882ce6ccfec19483723374b49e86355597288dbe1e8887cf428ce8b39"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.8/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "52a0572abe00fe1c403d75af9e8bf09b0be8973e6998f97603b656ef7c756bfa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.8/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2dee3670b281c40fdf88ecac8684424156fd54b5f87a23c623e0c556f19d175"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.8/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b47ea0a46c1fda23c9c2a63de68fd771e8da72d24638ea714043d7a152be40c7"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.8", shell_output("#{bin}/lean-ctx --version")
  end
end
