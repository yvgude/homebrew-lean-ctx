class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.12.0.tar.gz"
  sha256 "bc2ee339726448e5634a44119e36bd580f42da045d597dee6cb572e50bb7beb3"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.12.0", shell_output("#{bin}/lean-ctx --version")
  end
end
