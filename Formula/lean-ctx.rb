class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.17"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.17/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "8ae407858048ce952c51c7c736fb7deb2249a3797a06cd4b5b047d67484691b9"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.17/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "48b2fec31dbbdd71a504a540ff631be88427b79a837ff35c31a179491518529b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.17/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "478a1ec9c9f3b92dc3a4368208a27a200bd8395cd84ddd2bd3bd82b7debba42b"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.17/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fbff40e4eb25a0e15619fb8c947cbfee49962ecd3df97ee851c6bd7a97727b97"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.17", shell_output("#{bin}/lean-ctx --version")
  end
end
