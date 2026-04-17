class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.2.3/lean-ctx-3.2.3-source.tar.gz"
  sha256 "fd6b85f6a437d0ac9b68b784050db91b95d00208a9410b4b2cc50f30ef5d234d"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.2.3", shell_output("#{bin}/lean-ctx --version")
  end
end
