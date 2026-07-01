class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.18"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.18/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "f16c5b01525bdfe65f9879bcfada5aaf8f320d40d037a05e0a3bc939fc70b030"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.18/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "443cd863c4ca7112ad6fcfb6f644345d5a00badafb2b3ecdbef2042916a279fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.18/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d593bd14786bee7ceb7e3667f0a399e41a446a17a8fcfd2fa8cf6100cdfeceea"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.18/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7034281ffe13f3fe3a2a1564db5c217870788a96d406838692c4fec0ecd1ccbb"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.18", shell_output("#{bin}/lean-ctx --version")
  end
end
