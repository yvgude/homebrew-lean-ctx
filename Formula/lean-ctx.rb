class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v2.21.3/lean-ctx-2.21.3-source.tar.gz"
  sha256 "8d43b8a0d5b3a7ad89aebbad3322f33033dc6ff6a6b7b61f97438df79085bc8d"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.21.3", shell_output("#{bin}/lean-ctx --version")
  end
end
