class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.8/lean-ctx-3.6.8-source.tar.gz"
  sha256 "38c349dffdab88563094307b7b24c434663959e0bcd36216ad6b460e572011c7"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.8", shell_output("#{bin}/lean-ctx --version")
  end
end
