class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.12.6.tar.gz"
  sha256 "3376ac9821a40cd27f6e73f278a5fc90339ed9559ca54a0ec53ae3d47136ec28"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.12.6", shell_output("#{bin}/lean-ctx --version")
  end
end
