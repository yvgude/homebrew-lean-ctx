class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 58 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.22/lean-ctx-3.5.22-source.tar.gz"
  sha256 "8bfd0bff3472341193c3f9b921e2afa08ae909fdb9f83084f43f8352917f9de2"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.22", shell_output("#{bin}/lean-ctx --version")
  end
end
