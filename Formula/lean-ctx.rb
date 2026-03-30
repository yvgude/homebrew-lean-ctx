class LeanCtx < Formula
  desc "The Intelligence Layer for AI Coding — 24 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.9.4.tar.gz"
  sha256 "1bd5c3efabe584bf54109fbfca804d002c12d397591a42e613591fe43551b55b"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.9.4", shell_output("#{bin}/lean-ctx --version")
  end
end
