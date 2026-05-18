class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.7/lean-ctx-3.6.7-source.tar.gz"
  sha256 "b915c0f437ce1f9b90ba105d4d3a6e84b2f767048b50ada95825b871c07f6446"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.7", shell_output("#{bin}/lean-ctx --version")
  end
end
