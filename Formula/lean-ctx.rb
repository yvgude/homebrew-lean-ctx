class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "22eee5320abfbb2d41e6753a2ec250c1ea6f713136c91436de2dbb3a3a6a605c"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 1.6.0", shell_output("#{bin}/lean-ctx --version")
  end
end
