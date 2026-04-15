class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.1.5/lean-ctx-3.1.5-source.tar.gz"
  sha256 "8c5156c09d88d3def970a572811e78eb7c64de498c6f154d0353aa0f6e2bac42"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.1.5", shell_output("#{bin}/lean-ctx --version")
  end
end
