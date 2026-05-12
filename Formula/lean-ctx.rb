class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 58 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.19/lean-ctx-3.5.19-source.tar.gz"
  sha256 "147ea8b38f991de69956272a15fc8f7ebd187147ae7361f455d202d5014642fc"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.19", shell_output("#{bin}/lean-ctx --version")
  end
end
