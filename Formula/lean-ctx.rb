class LeanCtx < Formula
  desc "The Context Engineering Layer for AI Coding — 68 MCP tools, 10 read modes, 60+ shell patterns"
  homepage "https://leanctx.com"
  version "3.7.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.3/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "19805b50480d5ae1fdbea03b5ab75bf61c03d4c1d56b649238a184a5de09a6ac"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.3/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "6b25441865462240be455c6430c6231c97e2a28c5e639af7f7284441f8e623a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.3/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b4602e806674efedabed3c19c69376af87dc06f61180a408e5c3d805805f689"
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.7.3/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d034a6d1345db39057f9dc54c4a2536ed3f5805aa2ef6ec080f685190b014a47"
    end
  end

  def install
    bin.install "lean-ctx"
  end

  test do
    assert_match "lean-ctx 3.7.3", shell_output("#{bin}/lean-ctx --version")
  end
end
