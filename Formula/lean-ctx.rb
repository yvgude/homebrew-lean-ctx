class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.4/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "77897647cc9c0fd72e56028d4bf2a4209b9b9776da055789a8046600fa987bcf"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.4/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "dc947d0c461eec6f34267bd524f549f40a2e3f3887802e6599c17c0eefb25218"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.4/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e96fd653f67a1288f2e62166ea6bf27da9e7d8fdcfc92c132a1e54ee59788cb5"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.4/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a27d9ad46819dcab541fe4e8d4e0b70944ab615c424827556898d74325738611"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.4", shell_output("#{bin}/lean-ctx --version")
  end
end
