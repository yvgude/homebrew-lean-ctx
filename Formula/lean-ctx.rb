class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 25 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.15.0.tar.gz"
  sha256 "94b103e84091828fe5d93ed7578836c12b1b35791df7b9736e08a7e1b9bd3ce2"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.15.0", shell_output("#{bin}/lean-ctx --version")
  end
end
