class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.11/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "e3756f7b4e9196e1ecfdd024adcb49a556c5de2543948e16523fa827b5174d99"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.11/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "ef4a2b3f3251bfc591168c0da708344ef37d12fb47ab8e5e408755231cfd0a7f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.11/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "add02ccdd07138fa11d33e71411b851480adb07051581b5e9456b3df98d98025"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.11/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fab37f84639b677deed6613c7c324e13c395adf4c28e6e0dc2ba27f58e5b417c"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.11", shell_output("#{bin}/lean-ctx --version")
  end
end
