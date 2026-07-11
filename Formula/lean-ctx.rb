class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.7"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.7/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "05e334d849e8d37584c6a7692eb3d7158199e8a64670de6ca3331d11fbda66cb"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.7/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "1358a3881ee71fccdfd16f5c0919bfdf05cc0c3136bc33946cbff0ecd38f8cab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.7/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76a5befdefe787fdf3cec9b93132feb718b75378b647050eb4c9f9e85c34779b"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.7/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c47ff1678aecbef44ac3fe4bb257c0f7dd21b70b4b98d8922cd3c9c8b2ad3ffc"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.7", shell_output("#{bin}/lean-ctx --version")
  end
end
