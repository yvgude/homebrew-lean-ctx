class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.7/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "a77246015ee8b1ef23482986106c9fb06fae49c298d1fcc1241ec5a24dd9f8c7"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.7/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "0b687a49c7a505fcb4f0154f96ee4ba98534d61dff97b7b7522d31a1de4c08d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.7/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7ada04f3fa177b69e41e30fdcc0e4fb980799af87a05e26b7d2429c640405929"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.7/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a0d570158afc46aa20c821ca4b548897a252e4ced8a7740e6836939887f4161"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.7", shell_output("#{bin}/lean-ctx --version")
  end
end
