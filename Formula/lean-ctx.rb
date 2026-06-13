class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.3/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "c5956d131f4a4fd786896142d0751102c9b8f9526c0325bf87654ab88d27cce0"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.3/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "f770f5c2d403310670360c8e81381ab809f67f036b09b1345d3bc8a7cead6d7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.3/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5a58041625a8ea480bf67f31166148dd1c6628fef4556cff1e32c975b29af7c"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.3/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ace2b936fa92faa95f8406de40a7e66de7aa544e8d8dcab70898368337bb3ef"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.3", shell_output("#{bin}/lean-ctx --version")
  end
end
