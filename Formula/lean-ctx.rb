class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.13/lean-ctx-3.6.13-source.tar.gz"
  sha256 "e64a30dfe547ccce51201d01783dd699bb68a3619062587892babe17d6bdc235"
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
