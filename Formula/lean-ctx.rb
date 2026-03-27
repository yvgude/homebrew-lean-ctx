class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 21 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "cdfadac8ada8ca36cbad0c61ba05c05adb10e0ce88127d603a4e284361cfac27"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.5.0", shell_output("#{bin}/lean-ctx --version")
  end
end
