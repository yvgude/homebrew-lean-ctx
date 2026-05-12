class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 58 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.20/lean-ctx-3.5.20-source.tar.gz"
  sha256 "86785955dfea3b1c45b4077224476d7452931b609e244aeaeb71a87e7c88bdf9"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.20", shell_output("#{bin}/lean-ctx --version")
  end
end
