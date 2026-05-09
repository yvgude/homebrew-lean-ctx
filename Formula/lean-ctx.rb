class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.11/lean-ctx-3.5.11-source.tar.gz"
  sha256 "cc7588851e2ed2467b8272adb97980ee588d1764ed7fdfca38b34464972e1ddc"
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
