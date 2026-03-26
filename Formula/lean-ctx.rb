class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 21 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.3.3.tar.gz"
  sha256 "59f633cb8d5f41352494a02c29c4685556d4fc539ea3cec630bc0429495b5172"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.3.3", shell_output("#{bin}/lean-ctx --version")
  end
end
