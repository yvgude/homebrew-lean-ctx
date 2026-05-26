class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.19/lean-ctx-3.6.19-source.tar.gz"
  sha256 "c511f363717da4a52c85d33e81879af0cfa2b0788ea5c6b4130c8f4abe1df1c0"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.19", shell_output("#{bin}/lean-ctx --version")
  end
end
