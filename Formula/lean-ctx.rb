class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.4.1/lean-ctx-3.4.1-source.tar.gz"
  sha256 "f33edca3fc851f646b1f2010ffd5e224115a39dd580123363f1bee19405cbddd"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.4.1", shell_output("#{bin}/lean-ctx --version")
  end
end
