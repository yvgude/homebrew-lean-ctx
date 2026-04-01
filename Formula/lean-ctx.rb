class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.12.5.tar.gz"
  sha256 "7bb1fcd5c9fe3a3e00475f294830219c45308925bb96644ffe5bc3b5ce7a9dcc"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.12.5", shell_output("#{bin}/lean-ctx --version")
  end
end
