class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "12215fd718d833f28f40cfd1f90e7cd91f5629ab95d5c136792fca6b8e40f17e"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 1.5.0", shell_output("#{bin}/lean-ctx --version")
  end
end
