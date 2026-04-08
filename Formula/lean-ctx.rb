class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v2.21.1/lean-ctx-2.21.1-source.tar.gz"
  sha256 "e493befbdd796494d81728108a616c7fbfd5d3b1f90bd9483a912cae017d3cf6"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.21.1", shell_output("#{bin}/lean-ctx --version")
  end
end
