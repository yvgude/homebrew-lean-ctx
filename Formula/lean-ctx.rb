class LeanCtx < Formula
    desc "The Context Engineering Layer for AI Coding — MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.10.3"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.3/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "dc2af8200efae238bbadeb6e2ac0103e2c61cffbf967d8d6f39a9f70dbec9a3f"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.3/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "f69e49f2d8a1ac4b68a44c5704ce5f8cabbe886a125925ea5df974cb79bc5149"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.3/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f56d20fd8440a207576a34ec295f8b662731e30667a85506706a9b1fc660ecb1"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.3/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d66c0cb8cdb2c4af5ec77f25d745d70a99f87ef1729288561c68d53cd6bfd9f5"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.10.3", shell_output("#{bin}/lean-ctx --version")
  end
end
