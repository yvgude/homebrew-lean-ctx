class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 63 MCP tools, 10 read modes, 60+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.0/lean-ctx-3.7.0-source.tar.gz"
  sha256 "89a7503c2e403641c79d5287cc2f4a44bde8914758af3df5bd45cf8b83b94c31"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.7.0", shell_output("#{bin}/lean-ctx --version")
  end
end
