class LeanCtx < Formula
    desc "The Context Engineering Layer for AI Coding — MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.10.2"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.2/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "a1dac301a77234520729f1451af7959d6bdc1db56856123028398cb06d670615"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.2/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "ebe13f471247590bb3ca043b05f5f0420f218ba49d9ab492922444df00794289"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.2/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7d039950b23535ed56fe0772832508ba91f90ee31076dab99524cbb14c1fa16"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.2/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c723284eb889c359682080878fc56515ae03ff7742b98d7e56fa8a35bbff2fe"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.10.2", shell_output("#{bin}/lean-ctx --version")
  end
end
