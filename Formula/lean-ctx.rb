class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v2.21.9/lean-ctx-2.21.9-source.tar.gz"
  sha256 "0e3fc68da67fa1694c1524a1dfbfd387266991a45f1672737ef106fe8b706d1b"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.21.9", shell_output("#{bin}/lean-ctx --version")
  end
end
