class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.21.1.tar.gz"
  sha256 "8d36d29a07eda3386141fcaa3a43243e1b3c41a97c10ebf03ee4ab6c9db674f7"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.21.1", shell_output("#{bin}/lean-ctx --version")
  end
end
