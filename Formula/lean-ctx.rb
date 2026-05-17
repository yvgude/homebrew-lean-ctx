class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.4/lean-ctx-3.6.4-source.tar.gz"
  sha256 "d0193e433c996f108c9076e4b7fb082b37f85ae2f16a909bc7ccb051caebe232"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.4", shell_output("#{bin}/lean-ctx --version")
  end
end
