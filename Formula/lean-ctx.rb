class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 59 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.6.4/lean-ctx-3.6.4-source.tar.gz"
  sha256 "f560907132c25c21c73e5453be5ef6947f4cad9e80b3cd0aff1bbce2e2822afe"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.6.4", shell_output("#{bin}/lean-ctx --version")
  end
end
