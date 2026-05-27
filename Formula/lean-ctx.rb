class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.21/lean-ctx-3.6.21-source.tar.gz"
  sha256 "e9d96d68bd97058c9198440b4eab83db115256c1f56a436e9b8055c251b4e431"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.21", shell_output("#{bin}/lean-ctx --version")
  end
end
