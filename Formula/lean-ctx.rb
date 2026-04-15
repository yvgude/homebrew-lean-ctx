class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.1.4/lean-ctx-3.1.4-source.tar.gz"
  sha256 "ce3e2ecf87af8cb8d9b23a32c3b1490a8ba7c049141ae1cc19ec60f0274f905b"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.1.4", shell_output("#{bin}/lean-ctx --version")
  end
end
