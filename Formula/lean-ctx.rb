class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.9.10"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.10/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "19f577ed3457bfdb09d6f2858a92dd9f78b2561d08b58d58af7f1a810741ef21"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.10/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "22a18aa942dfb5b2a3731519db13a44d424cbdadcb94fbae0ac17e53c8488bce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.10/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "89872c75727037b97ab5d79127913651f06e8d68670952dd2ad0b7c972b04968"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.9.10/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3f3a886da7cad7a066added0e5ed81c14e1e4f976ce1b4420e413d9d9e075e4"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.9.10", shell_output("#{bin}/lean-ctx --version")
  end
end
