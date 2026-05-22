class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
<<<<<<< HEAD
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.15/lean-ctx-3.6.15-source.tar.gz"
  sha256 "0a1ce52d48d342b74f54816435b8562b9dc389c732814aa40da3ef49ea9ea2ba"
=======
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.15/lean-ctx-3.6.15-source.tar.gz"
  sha256 "0a1ce52d48d342b74f54816435b8562b9dc389c732814aa40da3ef49ea9ea2ba"
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
    assert_match "lean-ctx 3.6.15", shell_output("#{bin}/lean-ctx --version")
=======
    assert_match "lean-ctx 3.6.15", shell_output("#{bin}/lean-ctx --version")
>>>>>>> b15d212 (3.6.14)
  end
end
