class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.20.0.tar.gz"
  sha256 "39d706390aff053ba98f605d86228b22ee72c7c9e6baa13ea22ead24469cf0a3"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.20.0", shell_output("#{bin}/lean-ctx --version")
  end
end
