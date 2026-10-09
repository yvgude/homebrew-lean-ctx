class LeanCtx < Formula
  desc "Local engine for the LeanCTX Context Gateway for AI Systems"
  homepage "https://leanctx.com"
  version "3.11.2"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.2/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "46c33221c6b36c673aa8b39a112c7d3636756c5ef98f1788f899120bcfc6dad1"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.2/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "6309b91ec3dbf52eaec6f85d56fdcb72ffd8e4e41ae8bda0d485eea5ca8f68c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.2/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "554fb98577d537a45809f6e0c5ddaa41891c8033925e5a811f84dc271752f27f"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.2/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "25153e740fb217c43f4033e3751d9c6e4aec60d97f410ec0396b418e01d313d8"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.11.2", shell_output("#{bin}/lean-ctx --version")
  end
end
