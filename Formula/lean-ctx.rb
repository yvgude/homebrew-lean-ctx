class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.4/lean-ctx-3.5.4-source.tar.gz"
  sha256 "7d4840bc24a62c47217e48221e36dc658aa87a41057d24d4125d71e39863adc4"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.4", shell_output("#{bin}/lean-ctx --version")
  end
end
