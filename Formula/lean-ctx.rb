class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.5/lean-ctx-3.6.5-source.tar.gz"
  sha256 "611401182931b6365463c726b252287f4c925811f86dcf6a20c7a44fb3a1313b"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.5", shell_output("#{bin}/lean-ctx --version")
  end
end
