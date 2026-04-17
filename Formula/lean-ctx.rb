class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.2.1/lean-ctx-3.2.1-source.tar.gz"
  sha256 "5c9efb5d4e2de1945ae10c2fe440f9c1b723be480c8e4a6d06fa47be15a863bc"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.2.1", shell_output("#{bin}/lean-ctx --version")
  end
end
