class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.2"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.2/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "96165ad8a4e6d2c35328fc30ae0593889ad8f0c72cb1adf7a375bcd681aa6e66"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.2/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "00c6658db8702171fdc3818567ce42cd0fd003477a8c42be25a8a4e527d73d60"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.2/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "07d3ca583429a3455ec69eec21a70b2194ca5faecf6fb3b4cda5083ddd662911"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.2/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1feb7a00170ea8a1856b211133bb50333552c95a5dfd3a5106f0b1215e4b083"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.2", shell_output("#{bin}/lean-ctx --version")
  end
end
