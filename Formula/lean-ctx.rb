class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 21 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.3.2.tar.gz"
  sha256 "c1ed99b4f571749703d23d7c9c5c6db94f84957a3dbb46c96345f54aaeabfab9"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.3.2", shell_output("#{bin}/lean-ctx --version")
  end
end
