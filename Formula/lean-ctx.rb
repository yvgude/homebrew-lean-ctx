class LeanCtx < Formula
  desc "The Intelligence Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.5.tar.gz"
  sha256 "7d5d68f316606d2e9c02aca520db71b2a9ddcffc569e40e550135fe247101441"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.5", shell_output("#{bin}/lean-ctx --version")
  end
end
