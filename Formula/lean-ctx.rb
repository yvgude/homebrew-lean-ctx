class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.6.1.tar.gz"
  sha256 "1ce405930714ffe578e98a5c7a2cca84169e2fdccee36ddbee62d64516ac3401"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 1.6.1", shell_output("#{bin}/lean-ctx --version")
  end
end
