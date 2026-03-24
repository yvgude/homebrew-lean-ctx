class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server for AI coding tools"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "67d30f6fb4be5aba59ed395580814ceef6585032719bc4be228b0d0f66ce9922"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 1.4.1", shell_output("#{bin}/lean-ctx --version")
  end
end
