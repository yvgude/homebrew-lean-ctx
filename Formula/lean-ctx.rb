class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
<<<<<<< HEAD
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.24/lean-ctx-3.5.24-source.tar.gz"
  sha256 "4a35ecefc9133afd761c4d5be2802a5d6c00de2e7722b74038a5be6db8318f52"
=======
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.24/lean-ctx-3.5.24-source.tar.gz"
  sha256 "4a35ecefc9133afd761c4d5be2802a5d6c00de2e7722b74038a5be6db8318f52"
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
    assert_match "lean-ctx 3.5.24", shell_output("#{bin}/lean-ctx --version")
=======
    assert_match "lean-ctx 3.5.24", shell_output("#{bin}/lean-ctx --version")
>>>>>>> 77cf39e (3.5.23)
  end
end
