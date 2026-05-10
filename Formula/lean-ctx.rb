class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.13/lean-ctx-3.5.13-source.tar.gz"
  sha256 "b3f8202be13608b44d1112965f8d4bd30b4b136dee1571f7698c9707431d38c6"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.13", shell_output("#{bin}/lean-ctx --version")
  end
end
