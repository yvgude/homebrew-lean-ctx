class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.12.tar.gz"
  sha256 "4b525f3fc168c060b1a6e804d8a9014ecdd2922710bfe9f4c449a715d763fcfd"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.12", shell_output("#{bin}/lean-ctx --version")
  end
end
