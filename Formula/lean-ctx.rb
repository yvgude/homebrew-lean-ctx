class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.1.5/lean-ctx-3.1.5-source.tar.gz"
  sha256 "dbd92ab41df952326e863f991b887209157c3750c043ae2cdba02764fbd12b4f"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.1.5", shell_output("#{bin}/lean-ctx --version")
  end
end
