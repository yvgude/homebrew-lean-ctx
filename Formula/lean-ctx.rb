class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 58 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
<<<<<<< HEAD
<<<<<<< HEAD
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.16/lean-ctx-3.5.16-source.tar.gz"
  sha256 "2e4a34e430e5985c351609452ba81d2f9bdaafb09a63bba24c6f45ec4c5bace2"
=======
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.16/lean-ctx-3.5.16-source.tar.gz"
  sha256 "2e4a34e430e5985c351609452ba81d2f9bdaafb09a63bba24c6f45ec4c5bace2"
>>>>>>> 58ea729 (3.5.15)
=======
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.16/lean-ctx-3.5.16-source.tar.gz"
  sha256 "2e4a34e430e5985c351609452ba81d2f9bdaafb09a63bba24c6f45ec4c5bace2"
>>>>>>> e52e70d (3.5.16)
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.16", shell_output("#{bin}/lean-ctx --version")
  end
end
