class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 56 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.4/lean-ctx-3.5.4-source.tar.gz"
  sha256 "874e67d0e67d9721070bd15d430c8933f3a7c07ea1869f24431f31b6ce9a56cf"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.4", shell_output("#{bin}/lean-ctx --version")
  end
end
