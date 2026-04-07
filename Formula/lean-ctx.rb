class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.19.1.tar.gz"
  sha256 "11d4f7eb4589234eaf96f1230d971ec4384335938344d6b69e61221405947ace"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.19.1", shell_output("#{bin}/lean-ctx --version")
  end
end
