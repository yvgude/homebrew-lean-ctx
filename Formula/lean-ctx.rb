class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.3/lean-ctx-3.5.3-source.tar.gz"
  sha256 "49e1b10b0def9ff3dda2df7459d8a488c4e0417d2066a4dee4cc613456978dfb"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.3", shell_output("#{bin}/lean-ctx --version")
  end
end
