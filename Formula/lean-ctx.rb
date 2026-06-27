class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.14"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.14/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "7096682d6d6cd47bbdeceb143acce82426d884e621228b1215416357fb5184d9"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.14/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "18d65ec64510a7e23c6e9eaa979e9b336e420ac9a4312a23467f49e9ab700b08"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.14/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a702325cd328b1529404128e5e6100dbdba02757ffc6d5719f7996fe6af2f978"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.14/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "535e173459c3dfa638fd5faa373a876baf1d811637ad9363dfb9e8b95817cd93"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.14", shell_output("#{bin}/lean-ctx --version")
  end
end
