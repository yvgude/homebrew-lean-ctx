class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.4.5/lean-ctx-3.4.5-source.tar.gz"
  sha256 "2ea734c9377f3b3f4adca105a1e045f902e605e6de7561ec49445ec88d41db5a"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.4.5", shell_output("#{bin}/lean-ctx --version")
  end
end
