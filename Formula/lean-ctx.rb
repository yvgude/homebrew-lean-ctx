class LeanCtx < Formula
  desc "Hybrid Context Optimizer — Shell Hook + MCP Server for AI coding tools"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "39d823722be93ba6370f25be1969e272cb0271cf42e61d478277c87be193d998"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 1.4.0", shell_output("#{bin}/lean-ctx --version")
  end
end
