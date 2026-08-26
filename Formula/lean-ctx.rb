class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.20"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.20/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "4707f09d186d848e201a6256148249f441286c1bd4ad6579d397aa7cba02457a"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.20/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "a9c3cd4ac8ab60b4648c5bfdf1ba06cf32fa0c81526cc5845ed275bfc178c9d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.20/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49e07242dc066a2e2e82e5e154ad87382c0d9c2c322b08a0907d63db9d1816d1"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.20/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ed3e53dc656532c6f2f56f032f2a5d4d92a60b0749be87fb9bc2412d66a48da"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.20", shell_output("#{bin}/lean-ctx --version")
  end
end
