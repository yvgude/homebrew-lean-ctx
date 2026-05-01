class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.4.7/lean-ctx-3.4.7-source.tar.gz"
  sha256 "6ceb09ef9ef71c366ea62f27155caa735e9fe4ad3b4ee6e97cc8b16de473e80b"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.4.7", shell_output("#{bin}/lean-ctx --version")
  end
end
