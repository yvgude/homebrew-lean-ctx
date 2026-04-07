class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.19.0.tar.gz"
  sha256 "8fad9bb55cc74a9d39228e32c369da0241a7228532c5f7f4f8b340a52bbf0177"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.19.0", shell_output("#{bin}/lean-ctx --version")
  end
end
