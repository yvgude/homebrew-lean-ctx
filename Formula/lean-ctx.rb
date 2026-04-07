class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.18.0.tar.gz"
  sha256 "1969e8550ac25127cdb7b98b487284d0f27e5585353193c086c5c11a210f9e0a"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.18.0", shell_output("#{bin}/lean-ctx --version")
  end
end
