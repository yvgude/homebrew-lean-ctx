class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 36 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.1.1/lean-ctx-3.1.1-source.tar.gz"
  sha256 "04c836e3b09f9452b4d9f700ab59a3c0d6c20214fb96c8a60c3f8ebb5d595ebb"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.1.1", shell_output("#{bin}/lean-ctx --version")
  end
end
