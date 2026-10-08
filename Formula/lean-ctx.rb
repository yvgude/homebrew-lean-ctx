class LeanCtx < Formula
  desc "Local engine for the LeanCTX Context Gateway for AI Systems"
  homepage "https://leanctx.com"
  version "3.11.0"
  license "Apache-2.0"

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.0/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "7f062bd66efb33d0220fca0ee68b5f6561fc1b763d133df44ea0e11daa824c77"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.0/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "a84e724822c4c925d424744eaf9df17c55886ececf5482bdced0799dedcd1054"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.0/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "50f8853646820f90a908f5530fa4566aca6c49b4e4e33aae384be282a402d7d1"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.11.0/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32004ef3e8bea38e8f9b6effcb34ace3243c35a520d39cfc7ebbfce322790c0d"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.11.0", shell_output("#{bin}/lean-ctx --version")
  end
end
