class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.6"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.6/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "27ccfb0b926b3cab7657c9d2a12b32c2266638ab047417781f24acde7f02a936"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.6/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "4a016bece49b075d173a7adfa60ccca0719b451a5ab4d15c9f8c6a5d008e75e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.6/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e6332f372d8282c439a53db05cb42234081e53a99c92cd85b9702be34baba971"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.6/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12b1949669574d98a6569b380e69c8e7c8b77349ecd5658b8f045bee5a189656"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.6", shell_output("#{bin}/lean-ctx --version")
  end
end
