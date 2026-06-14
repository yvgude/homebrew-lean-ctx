class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 71 MCP tools, 10 read modes, 95+ shell patterns"
  homepage "https://leanctx.com"
  version "3.8.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.5/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "3319ce9d089a6cea803158ff8c4484fc0d63e41daa5e021d750afb12412ea0fe"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.5/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "5d602d4ce574269f471256e79eb02bec8529e0fdf585bd86d019b1c3f46fa84f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.5/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4c887f42b951d1696c7cad3898444f1f3a172f1dcd60b992fc677dc33e9b3707"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.8.5/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f226ea0fd7d94a4675cab3459e7c3a867a5d9242cb05aac98b0df006f9d8211"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.8.5", shell_output("#{bin}/lean-ctx --version")
  end
end
