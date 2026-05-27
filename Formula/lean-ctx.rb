class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.20/lean-ctx-3.6.20-source.tar.gz"
  sha256 "8383d084f9d373d7a11799b07b6e4798372a235389dff764012e3f7f70927c11"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.20", shell_output("#{bin}/lean-ctx --version")
  end
end
