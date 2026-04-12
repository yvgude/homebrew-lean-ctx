class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.0.2/lean-ctx-3.0.2-source.tar.gz"
  sha256 "77f20f3caf3d11014d7149ad5df8d172d0277d1b1ce2c44bf3002bce22d11d71"
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
