class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 23 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.7.0.tar.gz"
  sha256 "e15a8878e2663d6638f81f57061ffb5cbecae06c94b21bab64b252e80cb56cb3"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.7.0", shell_output("#{bin}/lean-ctx --version")
  end
end
