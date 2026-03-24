class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server with tree-sitter AST parsing"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.5.2.tar.gz"
  sha256 "1eb95dd163032a12c707276db376c73011758dd69a0bdd196f0772f4ebc81fdb"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 1.5.2", shell_output("#{bin}/lean-ctx --version")
  end
end
