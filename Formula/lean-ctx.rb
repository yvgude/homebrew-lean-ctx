class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 21 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.5.1.tar.gz"
  sha256 "82888cc21fd8b0a385c704a28c706953969ae4432b119fdd26198a39ff780c17"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.5.1", shell_output("#{bin}/lean-ctx --version")
  end
end
