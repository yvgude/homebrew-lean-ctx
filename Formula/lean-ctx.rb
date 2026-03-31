class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.16.tar.gz"
  sha256 "9a31301aae86d9fc7154eebd8ac1550203436b1ff71e0e0bc310bd3ccbf54aaf"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.16", shell_output("#{bin}/lean-ctx --version")
  end
end
