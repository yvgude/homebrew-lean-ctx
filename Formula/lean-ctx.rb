class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.3"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.3/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "2adf67848020a198fd08eeeafc8957b83cf793b42719a196ea4b3a40a2597eb8"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.3/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "d16aa4254f0e5ad0dc34ea19a6bc26b85a4a099b0f623f0ef1a1c97e62f7b69e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.3/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "47b74fa144b6b5820acc9e206544b00f3b7a93f322db5fb2dced6ee78639b212"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.3/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "091d76066c618068261f8b7e94b528f098278abdc572a2710d4d0ecb8aec5453"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.3", shell_output("#{bin}/lean-ctx --version")
  end
end
