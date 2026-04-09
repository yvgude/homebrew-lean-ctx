class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 28 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v2.21.10/lean-ctx-2.21.10-source.tar.gz"
  sha256 "f062395a9d3a0de55d92c36ca2341a9f050926835c6603af0c8615c813b426e2"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.21.10", shell_output("#{bin}/lean-ctx --version")
  end
end
