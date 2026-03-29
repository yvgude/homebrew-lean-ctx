class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 24 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.8.0.tar.gz"
  sha256 "eb60e00f995a3b950fd9787daf3cf711d65f75fc675a39c6217058233ed0862b"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.8.0", shell_output("#{bin}/lean-ctx --version")
  end
end
