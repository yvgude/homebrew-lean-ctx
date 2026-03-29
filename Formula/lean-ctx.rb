class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 24 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.8.2.tar.gz"
  sha256 "c56f9b1e6d76123cc0d695e7d1f6497ac5f5abc00032bb90ef1f2b3903e91f1f"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.8.2", shell_output("#{bin}/lean-ctx --version")
  end
end
