class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.5.0/lean-ctx-3.5.0-source.tar.gz"
  sha256 "8dea9b40a0510e42dd180f1e7bd17b746206decea2377077758eb861da21eb8c"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.5.0", shell_output("#{bin}/lean-ctx --version")
  end
end
