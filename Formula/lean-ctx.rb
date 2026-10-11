class LeanCtx < Formula
  desc "Local engine for the LeanCTX Context Gateway for AI Systems"
  homepage "https://leanctx.com"
  version "3.11.4"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.4/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "d0bc4b1b91715436e6b400dedbdfb1eaeba9dafa575d1d6c9a2f3296d040245f"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.4/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "26c305c4ef6f5e049ddb5b6aa0f2a112fafbebcce8456406d88d9b289e8010c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.4/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b9e5977d54f810ac81b94664353645dda2b906de21465291bbb7bdb7d18ec5e"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.4/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5044d0393f7b51bbb861435bd9d98694339678b4f827a690216d870b6719d56a"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.11.4", shell_output("#{bin}/lean-ctx --version")
  end
end
