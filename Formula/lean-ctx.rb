class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.3.3/lean-ctx-3.3.3-source.tar.gz"
  sha256 "951c9b0a9761468c4be90b2d2e47f49936937f89786a228dfb6d741dcc3b0c08"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.3.3", shell_output("#{bin}/lean-ctx --version")
  end
end
