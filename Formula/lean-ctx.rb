class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 21 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.5.2.tar.gz"
  sha256 "f3da2b0c2312ead6683438782d26c1aee4212b2dc81ee2e198aa2a9c932fd890"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.5.2", shell_output("#{bin}/lean-ctx --version")
  end
end
