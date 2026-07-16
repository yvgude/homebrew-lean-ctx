class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.11"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.11/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "a11a96db6c1680cc53d07a8080be604d3251c2d39fcbc883f36a645b8e95911a"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.11/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "66caa41930437c7696e4648565cdc59f334611d434a46ac4f0434bb5161c384d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.11/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "07878d5d598b620b227e91f48996d2f19bd1afc117329268ca25ad8a8a051d29"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.11/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b6804ed8ea9447fba332bb7e8d6a3d67349d9d77d1bcd1f43a8ebdedce1210d6"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.11", shell_output("#{bin}/lean-ctx --version")
  end
end
