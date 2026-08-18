class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.19"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.19/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "b9ee8f0865cd2dd4808f44ea100ed098fec99715cbddea2e9914ade1d9e9fb7b"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.19/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "55d0262d11f3280b12e340fa17fa895be07f12d30cb655ce32bffa79cd035993"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.19/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6c1b023aecedf59590a96d2edd73ec750b56acc5f2261df11abb52d84d8f134"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.19/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2fce32af52c2b7b2681ce8b14de9e67f55e1daf08e1513f47ff8dbb01eb0e58"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.19", shell_output("#{bin}/lean-ctx --version")
  end
end
