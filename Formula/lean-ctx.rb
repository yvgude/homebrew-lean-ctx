class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.12.9.tar.gz"
  sha256 "78cc682a13a9ea0750b690cd103ba4a9eff13c879b91ec5e0864fe341587b3fb"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.12.9", shell_output("#{bin}/lean-ctx --version")
  end
end
