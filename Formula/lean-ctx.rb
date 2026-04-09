class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v2.21.8/lean-ctx-2.21.8-source.tar.gz"
  sha256 "bdd3f3d2a850005efb35abae60f38dda0686eecb0f9950a9e15dea439042349c"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.21.8", shell_output("#{bin}/lean-ctx --version")
  end
end
