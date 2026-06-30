class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.16"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.16/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "c5dc9bf73e48fc7a0d46901c718ac2da3e21927e452e542ce0676281bdd0a81c"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.16/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "788ccbd29a78a5dfb8740446343a87ad4284db97dcc0ebce9f9d4c73b060cdab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.16/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49033754b39807250bc6f4d48d88eef678228950627683b093e24a431527893c"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.16/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a590a4e00f85a2802888bb89264f790d35b9c3f579ec8d75b387cf1b7897c36"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.16", shell_output("#{bin}/lean-ctx --version")
  end
end
