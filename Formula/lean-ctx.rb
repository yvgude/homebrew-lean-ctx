class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.12"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.12/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "ba441a98e59490a3a41826041c9f12bc18d7b4b660113031be72693f280c5861"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.12/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "77e240b7498cc51d594f1287497d2d431a6aeaf11b87e22e88c47418329338db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.12/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c049662abc2cb5e30db127e0ce71e2d7c4ef63d50ac23d76967c4c43603c7211"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.12/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57982aa9891537ff7323f52b49c1aae2c0452bfe2f89178b6436980aa0e7a802"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.12", shell_output("#{bin}/lean-ctx --version")
  end
end
