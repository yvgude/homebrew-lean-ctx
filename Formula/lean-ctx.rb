class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.25/lean-ctx-3.5.25-source.tar.gz"
  sha256 "8863a040d16e1078e87078e558feccff80d65183ac70ea5e7e7bd618a7041fb7"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.25", shell_output("#{bin}/lean-ctx --version")
  end
end
