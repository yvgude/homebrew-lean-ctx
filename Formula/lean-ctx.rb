class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.18"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.18/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "71bd627d80850e3ce5fd99a1477aaec118139b69422d208f4cf6c3e3edfc2281"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.18/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "4a241173207b834a57a69158cb44ada628147fa1a0ff641e52640761f29b2c95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.18/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b407363dbf9febc03d94be809ca93db51e68b73b6a93decdaee1b033f77946d7"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.18/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f23cd29d73a9f0cb5b6a34edead389e4567bb12afcde66738acecfecd61e2b4"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.18", shell_output("#{bin}/lean-ctx --version")
  end
end
