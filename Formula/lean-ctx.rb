class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 63 MCP tools, 10 read modes, 60+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.26/lean-ctx-3.6.26-source.tar.gz"
  sha256 "37e19a2bd56c8bf7f74efc9119f923d5001c3183744d57ce46cf6ac2854565eb"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.26", shell_output("#{bin}/lean-ctx --version")
  end
end
