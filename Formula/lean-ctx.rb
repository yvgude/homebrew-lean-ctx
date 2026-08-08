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
      sha256 "aa7817ae0c90c6d0e04fc2b5d68a828908cc7ed64e22ce77d66f6a0957ad700a"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.18/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "673500b1c0537962fea75f0d281fe173b97a3f8720d5fc850e8cd721de6a87eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.18/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da6d980002992f10488b10c6f2528265fac79516e8b05ea0e643a5b969d611dd"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.18/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e3676b2a3394e337815a8fe52aa3d56d47f198ffad266c783eb870e7a9e6678"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.18", shell_output("#{bin}/lean-ctx --version")
  end
end
