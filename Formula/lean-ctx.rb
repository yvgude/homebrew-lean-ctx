class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v2.21.6/lean-ctx-2.21.6-source.tar.gz"
  sha256 "cf7eefd07830df93a493d3ec987e7253115646a83744601764cecd55f0129a93"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.21.6", shell_output("#{bin}/lean-ctx --version")
  end
end
