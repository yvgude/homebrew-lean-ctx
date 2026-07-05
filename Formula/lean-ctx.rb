class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.1"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.1/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "2bca0aae29095fb0026fbebf4a1a9ca2dfe523ec28e8414a9e0d0d8dc6824a07"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.1/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "82b4960500353a75ca9b00b4c58d97d37c7bf308eb4b2a4daa8e1e674fd8d982"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.1/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f72972b4f4b2a4984cc5298dfd76e171876a57eb43f1ef1abafe88fc2ffde9e"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.1/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c4f32bf8cde920b5330c8df29d7034fe3e5e9c758158823e3d6bda2c324e747"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.1", shell_output("#{bin}/lean-ctx --version")
  end
end
