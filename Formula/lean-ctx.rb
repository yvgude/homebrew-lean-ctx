class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.10/lean-ctx-3.5.10-source.tar.gz"
  sha256 "037b91513c824c34231079bf10e7c4da7a2e171748f2c99b010f53c045fe92d3"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.10", shell_output("#{bin}/lean-ctx --version")
  end
end
