class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 25 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.16.1.tar.gz"
  sha256 "00033cb549fc3c0156ab5a29c9a58813a51e3c5d46043f37dc6ef6c4cc5f5f1c"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.16.1", shell_output("#{bin}/lean-ctx --version")
  end
end
