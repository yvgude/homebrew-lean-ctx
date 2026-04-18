class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.2.4/lean-ctx-3.2.4-source.tar.gz"
  sha256 "f1f2541fa45ddbe85a9ccf592cd5ce55cac5d02608b40778e28be58856a977fa"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.2.4", shell_output("#{bin}/lean-ctx --version")
  end
end
