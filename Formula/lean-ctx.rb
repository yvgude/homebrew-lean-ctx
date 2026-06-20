class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.10/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "5e727284358a69e2a72ac92062d5906f4d9add6a4bfc02355a59f0487922641d"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.10/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "704a315dba6e3a2b48bf5d97a7bab0bb8b529d49626ef5f99f59687e5a237861"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.10/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa9d4d0bbc5216687d2ac5b4874aecb210b72960d29a3a4d7effb42d2ea2f8eb"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.10/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a9ac7ea6519e552e7b74bbb69918502baca586db42f2df94ae8a4a0c56a7a55"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.10", shell_output("#{bin}/lean-ctx --version")
  end
end
