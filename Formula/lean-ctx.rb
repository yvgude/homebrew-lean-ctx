class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.16/lean-ctx-3.6.16-source.tar.gz"
  sha256 "fd8f8861ac21cd1603ea70cf60d10d529f772fc5f6e7a410ca80ec090984d7f7"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.16", shell_output("#{bin}/lean-ctx --version")
  end
end
