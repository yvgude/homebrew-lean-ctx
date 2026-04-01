class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.12.2.tar.gz"
  sha256 "ff9bd8c4ac003d43cee56b3792f552d26bb61769e1282ff74cf70cad76b13b3f"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.12.2", shell_output("#{bin}/lean-ctx --version")
  end
end
