class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.6.1.tar.gz"
  sha256 "54f731ab2daa1c275adfb185775f9f3f0b5e00830ffbd624b235140d1c7ed891"
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
