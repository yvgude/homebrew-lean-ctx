class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 25 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.17.2.tar.gz"
  sha256 "160c39dffc18dfd119d3d3df844e820796c8ecf331007ab7a43d01adb4562e50"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.17.2", shell_output("#{bin}/lean-ctx --version")
  end
end
