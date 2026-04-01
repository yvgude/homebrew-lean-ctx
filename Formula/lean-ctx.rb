class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.13.0.tar.gz"
  sha256 "2fcd5c928dcc04bd9e0c8d3c68bf8098a6e538454acd2a3da67a8a546968fe74"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.13.0", shell_output("#{bin}/lean-ctx --version")
  end
end
