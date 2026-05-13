class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
<<<<<<< HEAD
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.23/lean-ctx-3.5.23-source.tar.gz"
  sha256 "d96f1432c7bbaf408687bf6979b87ae1ddf03064f06a994889b7124481d3e6b3"
=======
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.23/lean-ctx-3.5.23-source.tar.gz"
  sha256 "d96f1432c7bbaf408687bf6979b87ae1ddf03064f06a994889b7124481d3e6b3"
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
    assert_match "lean-ctx 3.5.23", shell_output("#{bin}/lean-ctx --version")
=======
    assert_match "lean-ctx 3.5.23", shell_output("#{bin}/lean-ctx --version")
>>>>>>> 77cf39e (3.5.23)
  end
end
