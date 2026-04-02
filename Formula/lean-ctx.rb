class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 25 intelligent tools, 90+ shell patterns, tree-sitter AST"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v2.14.5.tar.gz"
  sha256 "c9eb324ef288c619a5da9bd7b62890cbf1fc93f147fd5b5d67ebf6c7d7473e48"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 2.14.5", shell_output("#{bin}/lean-ctx --version")
  end
end
