class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.1.2/lean-ctx-3.1.2-source.tar.gz"
  sha256 "145fbebd2526c7c754f8ad1588bb47fe06bdb2fa9d627878a7619976fad5b858"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.1.2", shell_output("#{bin}/lean-ctx --version")
  end
end
