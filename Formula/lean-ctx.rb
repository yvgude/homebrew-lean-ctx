class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.10.0.tar.gz"
  sha256 "0fb680072098acc405fd6328fa0c13ca32ad62ba441c937dd38699329e68895c"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.10.0", shell_output("#{bin}/lean-ctx --version")
  end
end
