class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "0bae1eedce2ae389af33df9a2335cbba2b8f47d79f3f8fc7f425c12a1752954f"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 1.5.1", shell_output("#{bin}/lean-ctx --version")
  end
end
