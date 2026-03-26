class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.1.3.tar.gz"
  sha256 "adadef9378c44c1141f4b42acd752580fe17316b1b730f734dd9405c7d5192d1"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.1.3", shell_output("#{bin}/lean-ctx --version")
  end
end
