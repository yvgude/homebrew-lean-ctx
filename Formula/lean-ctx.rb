class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.11"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.11/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "8f7735e2df93b99056d89d0d4d406f5d1d795968f49372018ac46b511e4c228c"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.11/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "1bfa42f5ec4c45398ba6687ec3e860678fd704d837110f926b48bbaa9bb773e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.11/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f8cb2a769ae00a22756bb60451d209fd52c6b7ba4859afb979d9afaad285d127"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.11/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69f48a29d9dbeddbb9bf087a304153b00588f2a67efa0bee282ae0381cb70f69"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.11", shell_output("#{bin}/lean-ctx --version")
  end
end
