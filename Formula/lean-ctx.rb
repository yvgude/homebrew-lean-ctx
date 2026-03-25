class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.8.1.tar.gz"
  sha256 "c7784d658bd6f93f6540e45eba0784b0d89ce21ce09c6d79c163e8a834f362f4"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 1.8.1", shell_output("#{bin}/lean-ctx --version")
  end
end
