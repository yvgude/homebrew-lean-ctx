class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.14.0.tar.gz"
  sha256 "6e383c2bbf3b7abf1a18f823559ff2c23578105a5cc1ddab70ee03f412aa6516"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.14.0", shell_output("#{bin}/lean-ctx --version")
  end
end
