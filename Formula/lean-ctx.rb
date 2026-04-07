class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 25 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.17.6.tar.gz"
  sha256 "97a2477aed340dea24b34b0f63bc8c0e06c45b12f3900a576027f9320dfa301d"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.17.6", shell_output("#{bin}/lean-ctx --version")
  end
end
