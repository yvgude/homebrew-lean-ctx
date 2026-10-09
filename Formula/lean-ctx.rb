class LeanCtx < Formula
  desc "Local engine for the LeanCTX Context Gateway for AI Systems"
  homepage "https://leanctx.com"
  version "3.11.1"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.1/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "149c4962c98e5de2d9bec8cc7bffa327d1b6784be28af497e542bb8789f63b63"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.1/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "33e8ffc80ea00206a6a4b60469bd4fe4323c1082b6706cf12d227a0653b6e872"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.1/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eea041a75919f600b5ef6cd6da35240bed2bfa6e5d7019a8e092f766428cd9ab"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.1/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08d9805c0405fdfebcd79c2deaeb6932f4d2b893b19241c3fc92fa64150ccbc0"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.11.1", shell_output("#{bin}/lean-ctx --version")
  end
end
