class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.0.1/lean-ctx-3.0.1-source.tar.gz"
  sha256 "d1cb3e4d0326f1523e39dfa3d4404143597b2e91e30b1d38d3f91692c6be96fb"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.0.1")
  end
end
