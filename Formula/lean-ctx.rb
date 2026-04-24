class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.3.6/lean-ctx-3.3.6-source.tar.gz"
  sha256 "4dfba6dd269874f44ac731de4efe1b33a945e4e12d7eb7564a059dbcbb68f29d"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.3.6", shell_output("#{bin}/lean-ctx --version")
  end
end
