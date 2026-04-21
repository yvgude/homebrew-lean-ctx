class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.3.0/lean-ctx-3.3.0-source.tar.gz"
  sha256 "e049a7d4f026b6d45feafa01b96b353b793b72fc0937bbfd89ae5f194790dfe4"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.3.0", shell_output("#{bin}/lean-ctx --version")
  end
end
