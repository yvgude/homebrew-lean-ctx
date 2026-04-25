class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.4.0/lean-ctx-3.4.0-source.tar.gz"
  sha256 "89caf537cac6ce5cb266b8b154776c25f88557512b7dd7a1922c05cb9efc1d1b"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.4.0", shell_output("#{bin}/lean-ctx --version")
  end
end
