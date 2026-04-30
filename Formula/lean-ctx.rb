class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.4.6/lean-ctx-3.4.6-source.tar.gz"
  sha256 "a1dd1ea29f1471ec41513c56588fd85afe81759e5b770bc9a0607b10f1ef6abc"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.4.6", shell_output("#{bin}/lean-ctx --version")
  end
end
