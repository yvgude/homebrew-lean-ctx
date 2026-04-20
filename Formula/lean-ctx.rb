class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.2.9/lean-ctx-3.2.9-source.tar.gz"
  sha256 "4f7cbd13eb0b77348d9abbdbcdcd4431a757d02f2f12f4370fbf89f1276e7a50"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.2.9", shell_output("#{bin}/lean-ctx --version")
  end
end
