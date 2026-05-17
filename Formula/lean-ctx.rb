class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.4/lean-ctx-3.6.4-source.tar.gz"
  sha256 "817dbc5dd9409c9ed83b7c5a9cf925f4e9ca06f6f8826412d83d9d38c0b42763"
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
