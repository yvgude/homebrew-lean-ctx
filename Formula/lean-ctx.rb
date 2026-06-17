class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.8/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "8dd63148a9c45dd1256a9ea17d18bdc529f67ce42b8fa88b5e1e7927e1b6632e"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.8/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "533ccb50c012a32d9d910d39ae9cfef737f43d04608c2ca834a570698da9dcac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.8/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fea8b391523ecf91b90406ec58f44fd717bdb273e81e5ab93223b353a9618e66"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.8/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "691436544156c5879fc6ab1c2fb89dfa3aa88d3f118164ff072abd6078fdad45"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.8", shell_output("#{bin}/lean-ctx --version")
  end
end
