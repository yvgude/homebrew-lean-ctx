class LeanCtx < Formula
  desc "Local engine for the LeanCTX Context Gateway for AI Systems"
  homepage "https://leanctx.com"
  version "3.11.3"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.3/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "07b2d253631b74a60e6f93894b0f036e0c97aa6872bd9bf0d852a156792d782b"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.3/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "42e90562dd197099150035554f75bc89a35a6f7091ac54aaa14686e5ad712258"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.3/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da7963d875ab9fa54fca14b7f778fbe23cf017d2f12fda0b04ba5dd64df6701f"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.3/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fbdbb345fa005708a947538b052745027402b9c63e880fc7888512e726e108ef"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.11.3", shell_output("#{bin}/lean-ctx --version")
  end
end
