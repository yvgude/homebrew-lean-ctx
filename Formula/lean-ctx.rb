class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 25 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.16.4.tar.gz"
  sha256 "1ee2bf149a5b2c1ed93887670b6dd37e0ac3364a1993600bdab50472406aa814"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.16.4", shell_output("#{bin}/lean-ctx --version")
  end
end
