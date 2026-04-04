class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 25 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.16.3.tar.gz"
  sha256 "2047ac22aff3d943db8569dfddc45c759f7064805548beb305951b739dd7333d"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.16.3", shell_output("#{bin}/lean-ctx --version")
  end
end
