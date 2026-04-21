class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.3.1/lean-ctx-3.3.1-source.tar.gz"
  sha256 "e4cc2d302cf9b72431eafdd71871f26cb5f40ca6521d4dead7ba2d013425e6d3"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.3.1", shell_output("#{bin}/lean-ctx --version")
  end
end
