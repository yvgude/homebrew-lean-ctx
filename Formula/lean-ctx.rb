class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 25 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.16.5.tar.gz"
  sha256 "4a3bd2c4b53fb7b41e64cdb187f0a9bbf5bf39b22ee584becf4bdc843b37b161"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.16.5", shell_output("#{bin}/lean-ctx --version")
  end
end
