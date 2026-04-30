class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.4.6/lean-ctx-3.4.6-source.tar.gz"
  sha256 "4c3fb8b655ba21a79a6f7da74a0d0f6cc3abb72241b02ccca446ae151074609a"
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
