class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
<<<<<<< HEAD
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.22/lean-ctx-3.5.22-source.tar.gz"
  sha256 "c41a100e499ec04ff708eb0e14e5f3fb42e25d0d32761e4a28ee9184d5b2424f"
=======
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.23/lean-ctx-3.5.23-source.tar.gz"
  sha256 "7cc9353d2476a4ffecf94f01a0fed8d7428808a8721ccbf32430274ae5aaaec6"
>>>>>>> 77cf39e (3.5.23)
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
<<<<<<< HEAD
    assert_match "lean-ctx 3.5.22", shell_output("#{bin}/lean-ctx --version")
=======
    assert_match "lean-ctx 3.5.23", shell_output("#{bin}/lean-ctx --version")
>>>>>>> 77cf39e (3.5.23)
  end
end
