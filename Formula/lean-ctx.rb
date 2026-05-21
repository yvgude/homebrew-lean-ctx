class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
<<<<<<< HEAD
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.14/lean-ctx-3.6.14-source.tar.gz"
  sha256 "59e2c3607fd67302906cc4413c2e86957ced8e79d0a92da263b6be3e55fde167"
=======
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.14/lean-ctx-3.6.14-source.tar.gz"
  sha256 "59e2c3607fd67302906cc4413c2e86957ced8e79d0a92da263b6be3e55fde167"
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
    assert_match "lean-ctx 3.6.14", shell_output("#{bin}/lean-ctx --version")
=======
    assert_match "lean-ctx 3.6.14", shell_output("#{bin}/lean-ctx --version")
>>>>>>> b15d212 (3.6.14)
  end
end
