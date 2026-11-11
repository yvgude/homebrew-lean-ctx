class LeanCtx < Formula
  desc "Local engine for the LeanCTX Context Gateway for AI Systems"
  homepage "https://leanctx.com"
  version "3.12.3"
  # Engine: Apache-2.0. Bundled LeanCTX Cockpit binary: LeanCTX Cockpit
  # EULA (LicenseRef-LeanCTX-Cockpit-EULA), which SPDX cannot express.
  license all_of: ["Apache-2.0", :cannot_represent]

  # Semantic search (ctx_semantic_search / embeddings) loads
  # libonnxruntime at runtime; the engine resolves it from the
  # Homebrew prefix lib dir. Without this dependency the dylib is
  # absent and ORT init fails. See issue #544.
  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.3/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "867aed6411d113af26d60a6c6bae91db24b52c6da2b6942932953654d43542df"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.3/lean-ctx-cockpit-aarch64-apple-darwin.tar.gz"
        sha256 "7d1b53fd731b087a425c4a58a38f56dcf479c4117d286c3f766d54b775819d2c"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.3/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "8c25c1a13cee0a81572d22c86fcd5ffb072ac84aba33ac4543ad98d8a3eeaec7"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.3/lean-ctx-cockpit-x86_64-apple-darwin.tar.gz"
        sha256 "7584b1155e03beb155361aa9a0b516be35d5180cf5aaf73c478f8bf86aa55a5b"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.3/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6bcc6529f56b5517f6e41b7f3e6887f1144f7cd577bd3998fb894383c4b0c2b9"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.3/lean-ctx-cockpit-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "543551fb4d38cb07db52d031f5f68757dfa8a967d4533e955b0d620d7dfe9aa3"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.3/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1adaf10972220d01f13a5ce42925bcebef6b47354ffbaa194995e555924b9e39"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.3/lean-ctx-cockpit-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "a0fcf2183cbb675c77d10b7c79a8d649cdad3304ed3a34fe1357d0d6c863ee28"
      end
    end
  end

  def install
    bin.install "lean-ctx"
    # The signed Cockpit bundle; lean-ctx verifies and imports it from
    # share/lean-ctx/cockpit on the first `lean-ctx cockpit`.
    resource("cockpit").stage do
      (share/"lean-ctx/cockpit").install "channel.json", "channel.sig",
                               "archive.tar.gz", "manifest.json", "manifest.sig"
    end
  end

  def caveats
    <<~TEXT
      The lean-ctx engine is licensed under Apache-2.0.
      The bundled LeanCTX Cockpit (lean-ctx cockpit) is free to use, including
      commercially, under the LeanCTX Cockpit EULA; it is not open source.
    TEXT
  end

  test do
    assert_match "lean-ctx 3.12.3", shell_output("#{bin}/lean-ctx --version")
    assert_path_exists share/"lean-ctx/cockpit/manifest.json"
  end
end
