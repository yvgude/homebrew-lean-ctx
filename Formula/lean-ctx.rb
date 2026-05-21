class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.12/lean-ctx-3.6.12-source.tar.gz"
  sha256 "c9633f1b4c9edcc947ccf2a6e35b74510e3f8152c69effc07bc21a0ce5821fcd"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.12", shell_output("#{bin}/lean-ctx --version")
  end
end
