class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 25 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.16.6.tar.gz"
  sha256 "a38dc41b2d506a8a26cf33fd68bf07eedcd4360447863358a1d99ae7a8d7ece8"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.16.6", shell_output("#{bin}/lean-ctx --version")
  end
end
