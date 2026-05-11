class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 58 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.15/lean-ctx-3.5.15-source.tar.gz"
  sha256 "0f10acd6614dcdf83190e1fbb22ccb638268a318ee183d0bddcfe534904277da"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.15", shell_output("#{bin}/lean-ctx --version")
  end
end
