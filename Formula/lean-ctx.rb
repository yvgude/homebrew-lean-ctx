class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v3.6.1.tar.gz"
  sha256 "f636860f26d1ce8e670f7e95b2714c8ffc13bbf15e58cbbf4eb435a521ce001a"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.1", shell_output("#{bin}/lean-ctx --version")
  end
end
