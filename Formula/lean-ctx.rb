class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.7/lean-ctx-3.5.7-source.tar.gz"
  sha256 "12437ecb10a391dcd3da7e588b48a9ce6b7906b649823c24bd6bf57d5d7c25a2"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.7", shell_output("#{bin}/lean-ctx --version")
  end
end
