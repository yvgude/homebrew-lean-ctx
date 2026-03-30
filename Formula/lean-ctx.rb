class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.11.tar.gz"
  sha256 "9e5ee1d8fa296d78740a787accdbb3f5e4d50f4a7135dff156830324ab7ef6ca"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.11", shell_output("#{bin}/lean-ctx --version")
  end
end
