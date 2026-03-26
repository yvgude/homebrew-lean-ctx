class LeanCtx < Formula
  desc "Context Intelligence Engine — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.1.1.tar.gz"
  sha256 "f097d90323f1b45bbbbafbc295308551659067d943a1ccd0e70305e81f729a05"
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
