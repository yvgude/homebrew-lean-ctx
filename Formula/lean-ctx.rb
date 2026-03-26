class LeanCtx < Formula
  desc "Context Intelligence Engine with CEP + CCP + TDD — 21 MCP tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "d20fe1f56bd74dc624afcc0ea332f2f51a65419ee6cd5d0115cf27cc9523e8da"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.3.0", shell_output("#{bin}/lean-ctx --version")
  end
end
