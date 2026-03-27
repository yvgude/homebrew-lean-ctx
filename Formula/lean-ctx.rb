class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 22 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.6.0.tar.gz"
  sha256 "48e3ba6d56cb8bc2f9ebeee6f162ff487104d310aa1882e03ad47624b1e9899c"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.6.0", shell_output("#{bin}/lean-ctx --version")
  end
end
