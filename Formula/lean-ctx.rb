class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.9/lean-ctx-3.6.9-source.tar.gz"
  sha256 "acf27c988883cd9b4a3041fddfe6d0bd47953427d6c5d31fc98963efc92e633a"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.9", shell_output("#{bin}/lean-ctx --version")
  end
end
