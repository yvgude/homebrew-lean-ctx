class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 25 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.14.4.tar.gz"
  sha256 "19e23a08b5651f8e5fa5e35d92194bb6f8e317409b866ced857d1709e06d40c7"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.14.4", shell_output("#{bin}/lean-ctx --version")
  end
end
