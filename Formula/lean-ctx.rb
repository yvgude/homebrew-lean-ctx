class LeanCtx < Formula
  desc "Local engine for the LeanCTX Context Gateway for AI Systems"
  homepage "https://leanctx.com"
  version "3.12.5"
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
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.5/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "b23133e86753a41864e2810751c67bf0583506528a53f48157edc4aacc5adb55"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.5/lean-ctx-cockpit-aarch64-apple-darwin.tar.gz"
        sha256 "ac76d89f955c09044300721d296dcfee5b8747c09f115934fa7cb3a4fd07d02b"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.5/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "a36adb53177def29530f2ba90affc82557a4db6da14a87aaaea68d567d610a89"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.5/lean-ctx-cockpit-x86_64-apple-darwin.tar.gz"
        sha256 "745c9b3f2a1f7a74cd1d37cb4ef6acac7baebbccf98d404ceca73d0d2737df66"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.5/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ed1ed2a83b30f234ae52e940901cdd181188c539bb328ca11c4993a8afe8bea"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.5/lean-ctx-cockpit-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "757bb37d441a6bb9154f64572f72a315669355eee9b27215c3b663f53ef0d53f"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.5/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c46d210a65d4fbc04a7393578ec545fa92101b3b34bc52ec00105c1afce139b"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.5/lean-ctx-cockpit-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "4076b290e071a1653d7fb2b682dcb8a374c08207e08bb36fc9e4699a0b21568d"
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
    assert_match "lean-ctx 3.12.5", shell_output("#{bin}/lean-ctx --version")
    assert_path_exists share/"lean-ctx/cockpit/manifest.json"
  end
end
