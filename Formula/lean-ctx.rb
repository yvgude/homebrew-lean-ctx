class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 25 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.17.1.tar.gz"
  sha256 "9ff2dea9686cd6c5dc2f9eef8e28ed51ae6199516ba1d22e916516dd5bc7a0e4"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.17.1", shell_output("#{bin}/lean-ctx --version")
  end
end
