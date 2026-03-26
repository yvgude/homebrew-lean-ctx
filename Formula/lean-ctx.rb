class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 21 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "bd90f529bc05a010a6a8dda918e9af9ec8525242754dacdd466b6650c017f0ed"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.2.0", shell_output("#{bin}/lean-ctx --version")
  end
end
