class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.11/lean-ctx-3.5.11-source.tar.gz"
  sha256 "e878075b9a0d849b0d924d4a611ccae8e986f43a660bd4c20f096e2f4db9c679"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.11", shell_output("#{bin}/lean-ctx --version")
  end
end
