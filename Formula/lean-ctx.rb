class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.0/lean-ctx-3.6.0-source.tar.gz"
  sha256 "105b930aa0de24e23693ba95d0314124283aad0048396f1a4eb9ebecc63756c0"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.0", shell_output("#{bin}/lean-ctx --version")
  end
end
