class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v3.6.16.tar.gz"
  sha256 "9399afc34c5beb6836dce308ce3c8e0109b59d297ecc2cdf9564f60d88755653"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.16", shell_output("#{bin}/lean-ctx --version")
  end
end
