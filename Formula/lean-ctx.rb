class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.5"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.5/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "a872740572a0da971c7a510e2e77c4b03954012dd7257191ed4f67506cc46ae4"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.5/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "34734e531ed3d630166786e9c4ca82622dd661ae6e19194f7468ac1c8967cbdf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.5/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a3a887d0e758269b01ef91e731d13546b041537ad7b7edc09da4f7497bba168d"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.5/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f91c92c90e858a1bfd1ab7a70d3e2cea67b1eb511ac0ed8ab1871684e68ed014"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.5", shell_output("#{bin}/lean-ctx --version")
  end
end
