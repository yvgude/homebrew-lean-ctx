class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.13/lean-ctx-3.6.13-source.tar.gz"
  sha256 "38467afcf1d3f783bb6f041aaedf36199100860311b8faf4c4be045a2b0becb0"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.13", shell_output("#{bin}/lean-ctx --version")
  end
end
