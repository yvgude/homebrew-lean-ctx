class LeanCtx < Formula
  desc "The Intelligence Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.3.tar.gz"
  sha256 "4f6ca64fa9d94161b24f90d68bd40d677e328079db7228027b4ace36b28c98d9"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.3", shell_output("#{bin}/lean-ctx --version")
  end
end
