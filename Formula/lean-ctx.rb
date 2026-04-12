class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.0.2/lean-ctx-3.0.2-source.tar.gz"
  sha256 "0a522855cbeb8a1ffd383551a6f38a70d3abf3fdd923ee73bdd83251260a323e"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.0.2", shell_output("#{bin}/lean-ctx --version")
  end
end
