class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.6.tar.gz"
  sha256 "d98509fca8b6a91eb3938a4783b251fb5d98cb22591c8cf87e82445c90d09032"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.6", shell_output("#{bin}/lean-ctx --version")
  end
end
