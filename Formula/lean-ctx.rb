class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 63 MCP tools, 10 read modes, 60+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.25/lean-ctx-3.6.25-source.tar.gz"
  sha256 "8c208c14aee2aee50a70b5c220266c3ead490cead1697268d11219c1a18be1bf"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.25", shell_output("#{bin}/lean-ctx --version")
  end
end
