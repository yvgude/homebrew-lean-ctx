class LeanCtx < Formula
  desc "The Intelligence Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.5.tar.gz"
  sha256 "6a87bbb627a987399ad3e5d6000f441864c3b5ca485ccad72259b8157c2c029d"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.5", shell_output("#{bin}/lean-ctx --version")
  end
end
