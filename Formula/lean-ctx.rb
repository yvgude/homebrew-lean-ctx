class LeanCtx < Formula
  desc "Local engine for the LeanCTX Context Gateway for AI Systems"
  homepage "https://leanctx.com"
  version "3.10.5"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.5/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "b5a899ea2010205af97263b0d2fdd86f785d7a4522f16c520c79685b72fb9dbd"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.5/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "0343fd6b013f1999122ddd00aa4817bed272d4a1b7f0f65151f5303b26e3434e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.5/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a43d69a7eba3dd5dc994fbe86616f435f43cf557b40ebbd79500cfcc50491932"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.5/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "917b292beca6aee29f81b58407452e5193ca62702557ab8abcbd1a6282abb878"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.10.5", shell_output("#{bin}/lean-ctx --version")
  end
end
