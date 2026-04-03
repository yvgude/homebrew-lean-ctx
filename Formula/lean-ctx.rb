class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 25 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.16.0.tar.gz"
  sha256 "96b246d1dbc33ac07d9dd96781d03eed892ff9e1d9694a2dc4b95930084b7403"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.16.0", shell_output("#{bin}/lean-ctx --version")
  end
end
