class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.11.0.tar.gz"
  sha256 "52b4ce8f7e14ebd89987b367a71611056b6d5ee4d7e18e46d10d2bf6ef84b47d"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.11.0", shell_output("#{bin}/lean-ctx --version")
  end
end
