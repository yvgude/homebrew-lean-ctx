class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 62 MCP tools, 10 read modes, 60+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.22/lean-ctx-3.6.22-source.tar.gz"
  sha256 "9e4f2ba3ceacfdc298d55907ce2011fd89ee0e3705f21ece69b6375cade34864"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.22", shell_output("#{bin}/lean-ctx --version")
  end
end
