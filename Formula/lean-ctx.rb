class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.0/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "2b749dfdfa74a749c8c411d8b9c1aba117826c55e171e742593317e8ba8e7fb3"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.0/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "1a3289e634f04c4cf2a259e87461dbd41c071feaae9e430cf7e7ec6e3ffe3c66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.0/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "98b9012bb82c8705906d19a934db76bf46a85c4310b8e11d4314710598fb4ae3"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.0/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a5b441fd2fe88d407a225b3732ff07114716df248a568093a41501bae7ac18a"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.0", shell_output("#{bin}/lean-ctx --version")
  end
end
