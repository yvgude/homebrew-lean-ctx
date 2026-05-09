class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.9/lean-ctx-3.5.9-source.tar.gz"
  sha256 "24a407a041edcd5fe1fae742cd22e5d872872d04d19c17e560258054ce6fbcd4"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.9", shell_output("#{bin}/lean-ctx --version")
  end
end
