class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.4.3/lean-ctx-3.4.3-source.tar.gz"
  sha256 "c632b9c538c1aeb0bd1dbdeb7ca259f0ab2e59c8beacab65c12ea1e93cd6a823"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.4.3", shell_output("#{bin}/lean-ctx --version")
  end
end
