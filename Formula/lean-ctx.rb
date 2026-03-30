class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.8.tar.gz"
  sha256 "f6e63957de4646ad36188cbc7aa184eacf11f3e035eaf5a5646b054c5e8206ff"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.8", shell_output("#{bin}/lean-ctx --version")
  end
end
