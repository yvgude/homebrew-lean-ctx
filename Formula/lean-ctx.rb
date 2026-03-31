class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.11.1.tar.gz"
  sha256 "acc48ceeebaf7e2a6291fb8b15847c4c232002a8af808de38d69ef1098657b3c"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.11.1", shell_output("#{bin}/lean-ctx --version")
  end
end
