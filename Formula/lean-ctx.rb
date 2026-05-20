class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.11/lean-ctx-3.6.11-source.tar.gz"
  sha256 "9ef9762ca883594172550d9ce0943446dac9d9cdd9bd6fc01da5bc15b2d88229"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.11", shell_output("#{bin}/lean-ctx --version")
  end
end
