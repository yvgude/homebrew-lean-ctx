class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.0.3/lean-ctx-3.0.3-source.tar.gz"
  sha256 "f43d0cd3d80cff31a5dcf331d2455a875581072c6e44003c4d1c0bb892a87462"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.0.3", shell_output("#{bin}/lean-ctx --version")
  end
end
