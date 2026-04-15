class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.1.4/lean-ctx-3.1.4-source.tar.gz"
  sha256 "32547e3d093db733f7d46044c8bb7a4917bddd2c253e79804d118f3680eda922"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.1.4", shell_output("#{bin}/lean-ctx --version")
  end
end
