class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.14/lean-ctx-3.5.14-source.tar.gz"
  sha256 "5461d286a827e1bc23711abc3cc18b1d207da8b00bb9e8fe9731efd154bf6643"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.14", shell_output("#{bin}/lean-ctx --version")
  end
end
