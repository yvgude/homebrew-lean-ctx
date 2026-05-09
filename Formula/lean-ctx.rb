class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.12/lean-ctx-3.5.12-source.tar.gz"
  sha256 "d45e8ce81b4388f98e3a23accef9f6209d592ddda78354f784ca417a063b43c7"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.12", shell_output("#{bin}/lean-ctx --version")
  end
end
