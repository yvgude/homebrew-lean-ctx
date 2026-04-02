class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.14.1.tar.gz"
  sha256 "58f3fcd2138bfe12f0325d1f6194e445c4ca586bce5db556e57f18efb1d75697"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.14.1", shell_output("#{bin}/lean-ctx --version")
  end
end
