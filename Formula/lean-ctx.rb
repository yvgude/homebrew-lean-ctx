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
      sha256 "1bb27a015e3cc899423048c0d1864f5e8238e19367f7c85fa8eee20abf2ffabd"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.14/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "1c503e1e0e78818ef19c05b7ca9df77574eaaccb8de10c10c7996b2832264b48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.14/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "25c0dc7256ce27a109923f87c6beb067fc0a9b54bf2ae167ec03bb5e3386e6c4"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.14/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "91e43ca41399276df45006e0ee5eadeaa398fb2b8437925078fc4466bbbb3574"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.14", shell_output("#{bin}/lean-ctx --version")
  end
end
