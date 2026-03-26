class LeanCtx < Formula
  desc "Context Intelligence Engine — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.1.2.tar.gz"
  sha256 "0e4d813979922758c28e472e1ac5e7d6c608342bbdceb4e53f8702980199ae80"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx", shell_output("#{bin}/lean-ctx --version")
  end
end
