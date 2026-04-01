class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.12.3.tar.gz"
  sha256 "6e313adab51b39f03dc8688bd02dace6ad9a0f4cd40f1fa65ff137543e725a7b"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.12.3", shell_output("#{bin}/lean-ctx --version")
  end
end
