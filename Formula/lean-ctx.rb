class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.12.1.tar.gz"
  sha256 "adf001704215a0df648791df8f38ad2abda80b072ca62fbd0a4a8aabccd433a9"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.12.1", shell_output("#{bin}/lean-ctx --version")
  end
end
