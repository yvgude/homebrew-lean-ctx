class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.5.3.tar.gz"
  sha256 "7c0cc42c78ba780a4d6d5b81024a4926f848af53157c8d99ee80a65fcb4d6a48"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 1.5.3", shell_output("#{bin}/lean-ctx --version")
  end
end
