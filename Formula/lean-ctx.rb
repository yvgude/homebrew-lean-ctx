class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v2.21.2/lean-ctx-2.21.2-source.tar.gz"
  sha256 "a3fae58315ae8e8d4a76e7c8e4c0d5af55028f9ca193d60526c152c803f139fc"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.21.2", shell_output("#{bin}/lean-ctx --version")
  end
end
