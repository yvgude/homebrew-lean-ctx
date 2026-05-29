class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 63 MCP tools, 10 read modes, 60+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.24/lean-ctx-3.6.24-source.tar.gz"
  sha256 "934bc8f5336d2cc367c10936f713099f8319d00fb7e4e523291426a62ccd1df7"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.24", shell_output("#{bin}/lean-ctx --version")
  end
end
