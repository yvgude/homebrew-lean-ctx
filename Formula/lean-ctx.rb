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
      sha256 "2b3836e03eb5ecff5da58486e295abfe4f191a835fefecbd174f632d740fa87e"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.14/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "4ef5e6ffff27af40fd6b086272fbb8417678f1ab32830782d4921e3a5f337f02"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.14/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e257ab434a2c396ae8ba18f227fc1be9e4b256e135b27522cf9770104b944500"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.14/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e905394f2607e78bd09e9e93b0884a2697426ead6383c8e7907b8cabf770d79"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.14", shell_output("#{bin}/lean-ctx --version")
  end
end
