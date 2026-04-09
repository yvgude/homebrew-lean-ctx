class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v2.21.7/lean-ctx-2.21.7-source.tar.gz"
  sha256 "fc0baa0ec51b37e3db39daccc5fbe3c36efebb7df609652e5744905762b7d7df"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.21.7", shell_output("#{bin}/lean-ctx --version")
  end
end
