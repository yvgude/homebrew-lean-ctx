class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.14.tar.gz"
  sha256 "192fb7e9ac0af6c20b0b6a97d85776ac224f40ce101b70fe8a620cf4121a8697"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.14", shell_output("#{bin}/lean-ctx --version")
  end
end
