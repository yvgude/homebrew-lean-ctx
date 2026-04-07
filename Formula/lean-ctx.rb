class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.18.1.tar.gz"
  sha256 "155c2e8a0b335b4c4481b5716a9dd2a8eea469ebb627fe8dd30557b94b9e9a86"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.18.1", shell_output("#{bin}/lean-ctx --version")
  end
end
