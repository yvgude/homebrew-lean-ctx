class LeanCtx < Formula
  desc "The Intelligence Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.0.tar.gz"
  sha256 "71ec15389999ba2d3b770a2d45e6286aa0ee1f4b2e00825a23d70cdff33cfc83"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.0", shell_output("#{bin}/lean-ctx --version")
  end
end
