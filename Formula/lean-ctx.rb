class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.8.2.tar.gz"
  sha256 "3434eb84926c79b213842373fe755de853768815611ada3dae2b6de680f1fd3a"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 1.8.2", shell_output("#{bin}/lean-ctx --version")
  end
end
