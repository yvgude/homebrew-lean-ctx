class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 62 MCP tools, 10 read modes, 60+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.23/lean-ctx-3.6.23-source.tar.gz"
  sha256 "1e7f0b658182f2096bcae8056a1a0bec4cc65f9423aaebf781a23da72e7932ab"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.23", shell_output("#{bin}/lean-ctx --version")
  end
end
