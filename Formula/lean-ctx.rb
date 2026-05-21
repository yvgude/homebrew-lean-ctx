class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.13/lean-ctx-3.6.13-source.tar.gz"
  sha256 "44f3198955f7bd813a06b30e7b7d222dfa973ba417b4b1f2f3136084d60227dc"
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
