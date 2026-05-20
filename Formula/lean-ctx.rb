class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v3.6.10.tar.gz"
  sha256 "4dcb9c230d5d8812b51cbf0faa5e9c8e6dd58841493bfc5d98494a9f24b08e75"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.10", shell_output("#{bin}/lean-ctx --version")
  end
end
