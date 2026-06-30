class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.17"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.17/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "dfc6e5f8a492df3f20dae6452fe820ca98add78846e8a17183ade7023fbf3a9d"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.17/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "596081cb4d259c8b335416499376de4c2827c11db7c8d1b68625b33691061d81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.17/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "94f915b1c714cced848ab895abc3e7cb789d7c0c6371fdd4553167c582c74dd8"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.17/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c150f266a3707ecd7988fa94299577ed3d3bd799e211d905829bcd21f585f0d"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.17", shell_output("#{bin}/lean-ctx --version")
  end
end
