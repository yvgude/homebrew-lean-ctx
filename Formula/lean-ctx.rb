class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.9.tar.gz"
  sha256 "61c771ec67010cfa9809aa2f5b440f5dc3a65863af7382f3d13780181ba4208d"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.9", shell_output("#{bin}/lean-ctx --version")
  end
end
