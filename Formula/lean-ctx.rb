class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.10.tar.gz"
  sha256 "df2a1e8bccdcaffaa77a2564ad42f8b8424d5512de625fe710ea6d4e3eb8e30e"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.10", shell_output("#{bin}/lean-ctx --version")
  end
end
