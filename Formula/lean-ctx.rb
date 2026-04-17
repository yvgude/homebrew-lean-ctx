class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.2.1/lean-ctx-3.2.1-source.tar.gz"
  sha256 "1e8545b226aafb3c18fad6e759cf67107c799036b53e1f73e7783fc0679afe69"
  license "MIT"

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
