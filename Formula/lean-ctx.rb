class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v3.6.9.tar.gz"
  sha256 "20a6789300ac0b7dcbf98f9fbbf7f3f217015f03836af7825d808e38b6c9f6ac"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.9", shell_output("#{bin}/lean-ctx --version")
  end
end
