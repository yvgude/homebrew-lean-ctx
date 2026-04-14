class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.1.0/lean-ctx-3.1.0-source.tar.gz"
  sha256 "ef6bb04b97b2c17a321e4f3542f7b121aa8009188448deb03da5f542aafb9456"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.1.0")
  end
end
