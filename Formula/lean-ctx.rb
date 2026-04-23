class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.3.5/lean-ctx-3.3.5-source.tar.gz"
  sha256 "41127594e82371ea36cda6e4dfa2657431db099969e042dd2a337b245882b4f8"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.3.5", shell_output("#{bin}/lean-ctx --version")
  end
end
