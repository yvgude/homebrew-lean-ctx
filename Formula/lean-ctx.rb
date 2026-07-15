class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.10"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.10/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "75eba6bc8f8116726be1b918d2fd342545fd93222fe82dae15c2c817eb7ea07e"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.10/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "c55d8a455f5c3dd56f497c8b671eeb7baa80f326688331f3e88ee752351a28ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.10/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9eacdbe3da059092f4a43cfe9462e0608dd50936fda6651f845b5e35f086198d"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.10/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d54b424ddc65bd0d7b3a1e6bdcb9e9b1b4bb4c9291898ece33c0c5d2d5582f49"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.10", shell_output("#{bin}/lean-ctx --version")
  end
end
