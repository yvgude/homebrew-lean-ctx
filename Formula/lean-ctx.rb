class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 58 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.18/lean-ctx-3.5.18-source.tar.gz"
  sha256 "1bcb5a7b8af1cf2177bb71075d18399b540c4dce8526c46e5380d78e222ba4b1"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.18", shell_output("#{bin}/lean-ctx --version")
  end
end
