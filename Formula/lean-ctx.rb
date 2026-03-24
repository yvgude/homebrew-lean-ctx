class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "d5e6c42b4910d76b6f4749951db7b62d3f2cbf9f4660dd301dedaa5df0e1b2a2"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 1.7.0", shell_output("#{bin}/lean-ctx --version")
  end
end
