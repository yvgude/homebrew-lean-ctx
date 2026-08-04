class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.16"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.16/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "2344872efdf8380b17edd68927addfd8d52f7e5bde2a2027dc67491b5411cbd7"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.16/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "7e25967682675da10baa40de21a79fa97fdffc95f883f179bc003e7ef8d07dc9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.16/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5e505a2e7c97a7667dd295dcc3081c61879804bee9bfa84b6954d24f40b7608"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.16/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0eab3c6118523d085bdd84a2fcdc3c95c32a94efb9fbae554f3f1aca8293661f"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.16", shell_output("#{bin}/lean-ctx --version")
  end
end
