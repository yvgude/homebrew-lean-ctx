class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.2.6/lean-ctx-3.2.6-source.tar.gz"
  sha256 "432a2a8f63392f7568e19246d4efaac4bbd6abd00b3772a64583ce84de1f6862"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.2.6", shell_output("#{bin}/lean-ctx --version")
  end
end
