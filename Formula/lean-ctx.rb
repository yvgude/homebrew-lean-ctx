class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.9"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.9/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "7c1155b58c5444ee6c7e4e41dca340e44ad68ffb84ca6093692d444ea93370eb"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.9/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "ac2d167b26b3c6cf945048c967b014a5163336750545e8b65bbcf778fad31b1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.9/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d692118c57c880214a0c4699f3ff6bde29bc00c699c149a3a8fe4be72824cf6"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.9/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee05f19305299db18e89d9ced8d6a15d3f6636408d9769fffbc81ec033d646f3"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.9", shell_output("#{bin}/lean-ctx --version")
  end
end
