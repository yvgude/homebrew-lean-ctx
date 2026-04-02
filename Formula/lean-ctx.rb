class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.13.1.tar.gz"
  sha256 "a7b5c9ecbcecd9bdc75d2aca0595f6504dd11bd9735b29796c7e4cba558c0557"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.13.1", shell_output("#{bin}/lean-ctx --version")
  end
end
