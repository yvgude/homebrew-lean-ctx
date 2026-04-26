class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.4.2/lean-ctx-3.4.2-source.tar.gz"
  sha256 "c833050b4d30d3eb94eef1316ead46e50de70d85d1d083457f6ec66a80859ccb"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.4.2", shell_output("#{bin}/lean-ctx --version")
  end
end
