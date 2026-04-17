class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.2.0/lean-ctx-3.2.0-source.tar.gz"
  sha256 "707f14ecb42c75bef99d997b13001e01f9ad4f58b768157fb38a29f418cfa8d4"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.2.0", shell_output("#{bin}/lean-ctx --version")
  end
end
