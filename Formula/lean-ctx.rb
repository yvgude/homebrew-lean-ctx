class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.2.5/lean-ctx-3.2.5-source.tar.gz"
  sha256 "405d85f7fe171e721d59e314325b267ad32f80175476d87c17b7804194c3950a"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.2.5", shell_output("#{bin}/lean-ctx --version")
  end
end
