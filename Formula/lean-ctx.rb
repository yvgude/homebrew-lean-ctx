class LeanCtx < Formula
  desc "The Intelligence Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.0.tar.gz"
  sha256 "e77ba907ab551c4d6861c2ccc07a8b582ca26f5f4c368997f64fa4bd7ab014c9"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.0", shell_output("#{bin}/lean-ctx --version")
  end
end
