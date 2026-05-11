class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 58 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
<<<<<<< HEAD
<<<<<<< HEAD
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.17/lean-ctx-3.5.17-source.tar.gz"
  sha256 "024b51b2ac2af6125842e069a7d8f7f8fda54aa35c1493fdabb9475fa465c2d5"
=======
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.17/lean-ctx-3.5.17-source.tar.gz"
  sha256 "024b51b2ac2af6125842e069a7d8f7f8fda54aa35c1493fdabb9475fa465c2d5"
>>>>>>> 58ea729 (3.5.15)
=======
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.17/lean-ctx-3.5.17-source.tar.gz"
  sha256 "024b51b2ac2af6125842e069a7d8f7f8fda54aa35c1493fdabb9475fa465c2d5"
>>>>>>> e52e70d (3.5.16)
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.17", shell_output("#{bin}/lean-ctx --version")
  end
end
