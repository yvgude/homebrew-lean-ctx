class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 42 intelligent tools, 8 read modes, RRF-based token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.3.7/lean-ctx-3.3.7-source.tar.gz"
  sha256 "7416c3aeb461b4eb550f7eaa1876e58c781fa5674051856f1579f5162173cb29"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.3.7", shell_output("#{bin}/lean-ctx --version")
  end
end
