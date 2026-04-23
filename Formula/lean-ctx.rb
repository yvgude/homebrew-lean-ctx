class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.3.4/lean-ctx-3.3.4-source.tar.gz"
  sha256 "72fe70646f56384938d8b731e9466dfefa2db020991bdcfd39ba8825426d4274"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.3.4", shell_output("#{bin}/lean-ctx --version")
  end
end
