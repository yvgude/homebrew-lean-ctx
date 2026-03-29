class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 24 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.8.1.tar.gz"
  sha256 "ae1b660839f81eb0166a01eafe90aed815c652a455603f815c686bee07448cff"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.8.1", shell_output("#{bin}/lean-ctx --version")
  end
end
