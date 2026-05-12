class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 58 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.21/lean-ctx-3.5.21-source.tar.gz"
  sha256 "19bfdd2ce28274b2cb9c676afac68868f31aafcacae416b8718ec8be38ca5a34"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.21", shell_output("#{bin}/lean-ctx --version")
  end
end
