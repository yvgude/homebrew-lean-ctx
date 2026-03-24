class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.5.4.tar.gz"
  sha256 "f57ff017129262dbd60009bf3990f2b6d68405a66f38490aa5afbf2574666446"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 1.5.4", shell_output("#{bin}/lean-ctx --version")
  end
end
