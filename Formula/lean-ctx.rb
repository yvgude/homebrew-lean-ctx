class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.2/lean-ctx-3.6.2-source.tar.gz"
  sha256 "6b453c7ec92d8b50c9b25033607d81fd0723bb763c8aa8d54f16dbcc4f23850d"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.2", shell_output("#{bin}/lean-ctx --version")
  end
end
