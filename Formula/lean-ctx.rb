class LeanCtx < Formula
  desc "Local engine for the LeanCTX Context Gateway for AI Systems"
  homepage "https://leanctx.com"
  version "3.12.6"
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
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.6/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "405eb2c5ebe64ce419160382825f0c6e5c0b4346474317980528a77b202977e6"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.6/lean-ctx-cockpit-aarch64-apple-darwin.tar.gz"
        sha256 "b88be3192c543e12b36026fac57c5ce37da6b8afa92d1e447db6f7d14b7f881f"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.6/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "e4d2a531672bd6cec24741430e4df34e9fdad5889893cb4e40c56cdc99a48f09"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.6/lean-ctx-cockpit-x86_64-apple-darwin.tar.gz"
        sha256 "b19ed37245930f77b6d14706f62ff91a98bc0e29692add6e76d052ba332deb64"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.6/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ef6c9081073360abbf643f9e4d6bcbd110b3eff1ca9a603c679238af08b83beb"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.6/lean-ctx-cockpit-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "dc5daf37474b3d18d1e92991be2d66d5b15bc2b319679c2320b419aa5d1eb2b6"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.6/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b205d4d158ac5425dabc50ddf491d11bbfdb1377121596ced8bb275040eb660d"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.6/lean-ctx-cockpit-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "229197684417d325d35001e468689d1e204e9dbc6a9e67df20ed5b4690c0db9d"
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
    assert_match "lean-ctx 3.12.6", shell_output("#{bin}/lean-ctx --version")
    assert_path_exists share/"lean-ctx/cockpit/manifest.json"
  end
end
