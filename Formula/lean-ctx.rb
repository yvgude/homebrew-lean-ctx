class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 21 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.5.3.tar.gz"
  sha256 "4b84e2b534da8d4ef0c2321730eafde7cceae4053bf292f9f1629ac1fca548b9"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.5.3", shell_output("#{bin}/lean-ctx --version")
  end
end
