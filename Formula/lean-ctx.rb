class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.12.8.tar.gz"
  sha256 "70604550a2ab53061dc0481c5542c5a22ac82429fb2dbd592721afa74f252f97"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.12.8", shell_output("#{bin}/lean-ctx --version")
  end
end
