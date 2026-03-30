class LeanCtx < Formula
  desc "The Intelligence Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.1.tar.gz"
  sha256 "9d82b4a4b9121285db88f14b5a2f6adc445584c7dd3b177294e1dd7882007612"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.1", shell_output("#{bin}/lean-ctx --version")
  end
end
