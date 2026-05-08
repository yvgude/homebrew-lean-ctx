class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.5/lean-ctx-3.5.5-source.tar.gz"
  sha256 "0f6a6b290dc31401585afbb15c9d0826ce34285051ca849a9093f19a6fc4ab07"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.5", shell_output("#{bin}/lean-ctx --version")
  end
end
