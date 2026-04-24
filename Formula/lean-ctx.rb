class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.3.9/lean-ctx-3.3.9-source.tar.gz"
  sha256 "da4a74ffbaeda14db5af876bfddf6ea45606845c49dc96be3b3bc18eef7e0b07"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.3.9", shell_output("#{bin}/lean-ctx --version")
  end
end
