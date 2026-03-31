class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.13.tar.gz"
  sha256 "0daf6267db49545a3443cd5810e99c3212ea1d7203a174f4e03235ba50c233ff"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.13", shell_output("#{bin}/lean-ctx --version")
  end
end
