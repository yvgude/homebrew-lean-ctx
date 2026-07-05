class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.0"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.0/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "ea0025fb66693e0d1f39127d379968cd306b7cc01fa50a6a2688999c7e721654"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.0/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "ad8b09a37136dca0aba97ebe70abfd92e460ce2a7a6e648dd8989fbe43ba4bfd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.0/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e769f5c75251c99b51519b45c6cff65779db167e1967ff907a0215cdd99e8ce5"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.0/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d39f891a5f171202ae5b710fc628862322e363db0ebad72308bd22ff7f846fb"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.0", shell_output("#{bin}/lean-ctx --version")
  end
end
