class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.2.7/lean-ctx-3.2.7-source.tar.gz"
  sha256 "646061220dbf8f1c7f421b5401da64522e30eceb5a8eb9857820ef8b6e023f21"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.2.7", shell_output("#{bin}/lean-ctx --version")
  end
end
