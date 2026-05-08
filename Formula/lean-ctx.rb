class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.8/lean-ctx-3.5.8-source.tar.gz"
  sha256 "1421faf00bbf15837620b83b2f55da81c9557ba3c64d46d25f0c86cfa19a41d4"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.8", shell_output("#{bin}/lean-ctx --version")
  end
end
