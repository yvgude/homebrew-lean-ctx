class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.3.8/lean-ctx-3.3.8-source.tar.gz"
  sha256 "02aa5fcc5d3299f329faee13bdfa26430fe080601624164df55cee8941166c7d"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.3.8", shell_output("#{bin}/lean-ctx --version")
  end
end
