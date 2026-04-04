class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 25 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.17.0.tar.gz"
  sha256 "c839c896319d1d92c16da0fd25e248a8a6077f9b402716c1295e66492c7cdbb3"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.17.0", shell_output("#{bin}/lean-ctx --version")
  end
end
