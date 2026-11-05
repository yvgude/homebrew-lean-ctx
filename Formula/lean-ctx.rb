class LeanCtx < Formula
  desc "Local engine for the LeanCTX Context Gateway for AI Systems"
  homepage "https://leanctx.com"
  version "3.12.2"
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
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.2/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "74fdf707eca87761c818c2caae2805b990c83a5fb459d7e7de541e525b2afadc"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.2/lean-ctx-cockpit-aarch64-apple-darwin.tar.gz"
        sha256 "d191dc84f930d658882a16c7cf327afbe160fe7c0a4a8850c44f0ee2f50af568"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.2/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "f7787f1f574720d0f25d4c63b586961d373cad8e2459643b13ef05cdf87f90a8"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.2/lean-ctx-cockpit-x86_64-apple-darwin.tar.gz"
        sha256 "d920d5bf0b8c6d3648fba44379811c4f40a172a316520c5cfdec7112f3552106"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.2/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa58bca469eb44a2bfa5b1e8bab5d5164deac1a28e75343e745aab05142c3b4f"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.2/lean-ctx-cockpit-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "ca6d3eed3d7c98570006f2edb095ab0f02f88195a1303c6ce501a0cbd6b141ed"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.2/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "501a4c209e92e6e2345ef875440944aa046d86b16a8c2f2df8099f234a75a078"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.2/lean-ctx-cockpit-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "4890b5897472a73c94da0148806be7407f081cd1c6fb821e73bcc4cc8a2bb3fe"
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
    assert_match "lean-ctx 3.12.2", shell_output("#{bin}/lean-ctx --version")
    assert_path_exists share/"lean-ctx/cockpit/manifest.json"
  end
end
