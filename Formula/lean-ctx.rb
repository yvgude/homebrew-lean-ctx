class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.3/lean-ctx-3.6.3-source.tar.gz"
  sha256 "519656c4110c6faa5c5e6a23f458ab1cf200a173657a426dbe6c61f313e599f2"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.3", shell_output("#{bin}/lean-ctx --version")
  end
end
