class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.6/lean-ctx-3.6.6-source.tar.gz"
  sha256 "6a3de29e97d9da701fd136b857f4b2fd7128655506838289f11906a3e2280be9"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.6", shell_output("#{bin}/lean-ctx --version")
  end
end
