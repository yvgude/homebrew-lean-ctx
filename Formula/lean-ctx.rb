class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
<<<<<<< HEAD
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.13/lean-ctx-3.6.13-source.tar.gz"
  sha256 "44f3198955f7bd813a06b30e7b7d222dfa973ba417b4b1f2f3136084d60227dc"
=======
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v3.6.14.tar.gz"
  sha256 "e8b657cdba194256de5773c776d303b0b07dfc6152fbee5ce3faca99963055ee"
>>>>>>> b15d212 (3.6.14)
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
<<<<<<< HEAD
    assert_match "lean-ctx 3.6.13", shell_output("#{bin}/lean-ctx --version")
=======
    assert_match "lean-ctx 3.6.14", shell_output("#{bin}/lean-ctx --version")
>>>>>>> b15d212 (3.6.14)
  end
end
