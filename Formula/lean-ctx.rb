class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.6/lean-ctx-3.5.6-source.tar.gz"
  sha256 "48799adea462ef8d4309c407b56b820eaed8ab8f743d97b1bfd50902633f08d3"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.6", shell_output("#{bin}/lean-ctx --version")
  end
end
