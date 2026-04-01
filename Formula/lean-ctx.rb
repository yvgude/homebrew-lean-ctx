class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.12.4.tar.gz"
  sha256 "6509c2a92c1bbe4e67921abf6b1a5a4addb525eace8c638567e12c430a938e5e"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.12.4", shell_output("#{bin}/lean-ctx --version")
  end
end
