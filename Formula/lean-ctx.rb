class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.10.0"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.0/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "ecd773971d118a19a3de723e82d9f0831c8e1543094d350b3861bcaa75dc6035"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.0/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "b45262e49491e3b9fd477bcbe34e3a550595772cc505a5fb78cfd6951ec592a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.0/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e3687477da897ddc363a2a35b91b362cd45bdc72256bb8b250dd700e9f94bfe4"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.10.0/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f5ad20cbf3eba9ff3024348cc0abe71199f47ae0e13d5554bfeb6345154928e0"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.10.0", shell_output("#{bin}/lean-ctx --version")
  end
end
