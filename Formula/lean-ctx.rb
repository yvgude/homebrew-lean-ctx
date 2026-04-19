class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.2.8/lean-ctx-3.2.8-source.tar.gz"
  sha256 "1fff52b0019cce85ea1e8b1bd03581c414ea29e6b5a7e6e1f0c8c8954a89cc46"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.2.8", shell_output("#{bin}/lean-ctx --version")
  end
end
