class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/archive/refs/tags/v3.3.1.tar.gz"
  sha256 "c06ceb2c2e3d74cb6c2467afd38e3f25bb1505cf11871af02078409beb0e2387"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.3.1", shell_output("#{bin}/lean-ctx --version")
  end
end
