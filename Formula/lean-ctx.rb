class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 21 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.3.1.tar.gz"
  sha256 "51f82a67569ecd9d42ad89c1be505ae525e87fc62cd465b2e82b655c806518bb"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.3.1", shell_output("#{bin}/lean-ctx --version")
  end
end
