class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.2/lean-ctx-3.5.2-source.tar.gz"
  sha256 "92e5c5acb9310947977a21f66585d78077827edffa503177151b3e5bc31ba7a2"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.2", shell_output("#{bin}/lean-ctx --version")
  end
end
