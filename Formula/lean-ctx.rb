class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 34 intelligent tools, 8 read modes, neural token optimization"
  homepage "https://leanctx.com"
  url "https://github.com/yvgude/lean-ctx/releases/download/v3.0.3/lean-ctx-3.0.3-source.tar.gz"
  sha256 "dcdf785f0770782748a01b922a29af6cb320b5d077886772b2cb21d42f784881"
  license "MIT"

  depends_on "rust" => :build

  def install
    cd "rust" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "lean-ctx 3.0.3", shell_output("#{bin}/lean-ctx --version")
  end
end
