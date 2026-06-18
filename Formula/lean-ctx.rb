class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.9/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "bfc42d221fc4b23432a447afc93e744581c9c0887b81b0c361588e431fe19171"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.9/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "9040c898821792500d921d3e4e3ce41ae97c5ee80d4f4a250ae2ecd72ebed20b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.9/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "742645bedca60450dc4c5b1a5a921f2987c08dbce95fb94759a10dfdd2213052"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.9/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2467310260497a84c6017bef287bda2f38d2836e54c0671c37e0e95ae8ed23b"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.9", shell_output("#{bin}/lean-ctx --version")
  end
end
