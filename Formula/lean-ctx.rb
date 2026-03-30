class LeanCtx < Formula
  desc "The Intelligence Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.2.tar.gz"
  sha256 "bf446659bbdc5d3ffc26eb8ef7babd59faa561b9c4799a9864d5865a163876e9"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.2", shell_output("#{bin}/lean-ctx --version")
  end
end
