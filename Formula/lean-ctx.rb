class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.10/lean-ctx-3.6.10-source.tar.gz"
  sha256 "ca533c76ac3e6fd5baf7a8aafd73b4a32f973c1946caadf2df3653a251fa98e9"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.10", shell_output("#{bin}/lean-ctx --version")
  end
end
