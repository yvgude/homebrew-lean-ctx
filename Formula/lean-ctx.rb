class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 21 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.4.1.tar.gz"
  sha256 "4389cae958906a13e9baadb4762d3291f1fdc0e8bb1034efd6af5a8ffc7fdb9a"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.4.1", shell_output("#{bin}/lean-ctx --version")
  end
end
