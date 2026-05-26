class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.18/lean-ctx-3.6.18-source.tar.gz"
  sha256 "389de8079d902c8ca7860374d51dee9b58d269ac8f1cc25c9657ad8e4d1d84b6"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.18", shell_output("#{bin}/lean-ctx --version")
  end
end
