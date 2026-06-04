class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 67 MCP tools, 10 read modes, 60+ shell patterns"
  homepage "https://leanctx.com"
  version "scode-v0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/vscode-v0.1.0/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "fb1694c7274966b4a57c29ecfd5a6d1cc66d4e011755f6c7e107991cac3bfd36"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/vscode-v0.1.0/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "7169939fc433e7683fb16521c815c1a406e7a17c6c5b61e4e3babdb0d35b674d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/vscode-v0.1.0/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3bf35d6c3bb95d17a00940939b5a169865375febeb2b6f4dcdfbf47fe0b361a3"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/vscode-v0.1.0/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "572a21cecbcdb56562e1f67a3ff90bcc30ae63a7c3170f42e85688a0c3d47f55"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx scode-v0.1.0", shell_output("#{bin}/lean-ctx --version")
  end
end
