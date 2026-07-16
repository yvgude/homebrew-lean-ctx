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
      sha256 "18227fd606a4baeab243174a5fdf518867f1ddcdd8a44f99e4a9737c9601c518"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.11/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "e7b651a21681057e30e456425e97c87d601a0727e3985947a337aa5ed218586e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.11/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ba48303ebd4ab9522de329a4108adb0964d31b3d6ad33658ec91daca2fcd6603"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.11/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6a73ec8e301f9c5c087432304ec95f5500c20f0c2bfe71fee4cc74331e84cec"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.11", shell_output("#{bin}/lean-ctx --version")
  end
end
