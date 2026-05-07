class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.4/lean-ctx-3.5.4-source.tar.gz"
  sha256 "70570c5b6265aa4e0cc16092a13b54929f7aa08598bb12ed7cc954b308df3364"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.4", shell_output("#{bin}/lean-ctx --version")
  end
end
