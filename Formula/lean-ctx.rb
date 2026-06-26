class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.13"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.13/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "c75b782fdf16669069c09758bfde3bcd12f8f462eb7f6bc9c1d2a253e1c13949"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.13/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "5b8d3b77e6401c8ffbf17e21ba354b33a3edba9b6b7207b456b3807f69c522d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.13/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df69f867f432fa052c7d3474c7dcfb94e2857031248499c2eb236cfc785bc3b4"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.13/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b6c5f57462e83b08427ae51288e1990e010425d7ec1bfecc65227d9ac5919a3"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.13", shell_output("#{bin}/lean-ctx --version")
  end
end
