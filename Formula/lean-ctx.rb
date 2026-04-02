class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.14.3.tar.gz"
  sha256 "cadaab1b15c5cefaf8e3affe431f8ccb884379eb38957935758af4359b5d2e58"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.14.3", shell_output("#{bin}/lean-ctx --version")
  end
end
