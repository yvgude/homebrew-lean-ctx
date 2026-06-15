class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.6/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "a9feb931d6df2111710b36a969b875481d58db8f80ee9557dedbd301ae1b8747"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.6/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "fae3cf2008911ba465f6b746f9d8bdca448ded084eb94dc3eaeb6a5b89884cb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.6/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "664152a04140f74442030b421fde2be2e0e3fa68888d8275b964c8e3926b51d3"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.6/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "785b4b55b35a5b14224a0795b12fd2b71ac183b6b9b8f0251932acde1b765ffd"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.6", shell_output("#{bin}/lean-ctx --version")
  end
end
