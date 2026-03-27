class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 22 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.6.1.tar.gz"
  sha256 "27812d008ae5fd0efaa9553710c9f5eabb3afb5d4bf102db547299588df79a2a"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.6.1", shell_output("#{bin}/lean-ctx --version")
  end
end
