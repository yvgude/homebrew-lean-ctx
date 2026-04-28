class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.4.4/lean-ctx-3.4.4-source.tar.gz"
  sha256 "a8ad906fa54937614fa5ae0ecf35d98d707e6eade676ea18730d6728a95d60b2"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.4.4", shell_output("#{bin}/lean-ctx --version")
  end
end
