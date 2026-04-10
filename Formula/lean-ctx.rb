class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.0.0/lean-ctx-3.0.0-source.tar.gz"
  sha256 "fe5dd38c3468bb23926237d7d20fbb2d7dce77627919b51b36c0449faa991f44"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.0.0", shell_output("#{bin}/lean-ctx --version")
  end
end
