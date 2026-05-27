class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
<<<<<<< HEAD
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.20/lean-ctx-3.6.20-source.tar.gz"
  sha256 "8383d084f9d373d7a11799b07b6e4798372a235389dff764012e3f7f70927c11"
=======
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v3.6.21.tar.gz"
  sha256 "9b335549fa00611c6e7e880b2a67c6ed1b656a104e39528ac353d394b94f3555"
>>>>>>> 708ec10 (3.6.21)
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
<<<<<<< HEAD
    assert_match "lean-ctx 3.6.20", shell_output("#{bin}/lean-ctx --version")
=======
    assert_match "lean-ctx 3.6.21", shell_output("#{bin}/lean-ctx --version")
>>>>>>> 708ec10 (3.6.21)
  end
end
