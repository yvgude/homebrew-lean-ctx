class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "f65e314809d351d3185c4e723e03e28914f3ba3312e10a73f4a9f325dfc7b2e3"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 1.8.0", shell_output("#{bin}/lean-ctx --version")
  end
end
