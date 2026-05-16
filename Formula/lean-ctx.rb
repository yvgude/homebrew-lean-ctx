class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.1/lean-ctx-3.6.1-source.tar.gz"
  sha256 "b6e8a4c88db4391bbcd8b466a31f25e5f57c73d43d75d53db03904ceb5469c3c"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.1", shell_output("#{bin}/lean-ctx --version")
  end
end
