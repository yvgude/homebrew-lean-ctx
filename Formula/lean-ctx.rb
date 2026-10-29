class LeanCtx < Formula
  desc "Local engine for the LeanCTX Context Gateway for AI Systems"
  homepage "https://leanctx.com"
  version "3.12.0"
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
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.0/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "2494dec82c47250c84166a897ba18e7c9e09f9cbe39b8f9a06024df49b89a7d2"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.0/lean-ctx-cockpit-aarch64-apple-darwin.tar.gz"
        sha256 "df3ef8ae4893322c2424704d51f90760fa8456de283d5eaaa122218307fff426"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.0/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "c8aac20064af55b2ae1c8a5fec4581ca357da696803a536f38c1b62c2cbd6504"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.0/lean-ctx-cockpit-x86_64-apple-darwin.tar.gz"
        sha256 "6dd2864f3839a2d684f0aecf4193a208206398d1ffc027c1e7eeffb24bf4cbe0"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.0/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b35971fae9d1594c76c53dcde87fa67fa104460b9ad73f4d480f25fb3c3b14d"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.0/lean-ctx-cockpit-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "ae487408a7a1576ce4315394cab5c2ca3be0852a62595d98994afa71cc1c3704"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.0/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a91d94c9057c15a94dae147772e7a00ff26bb8566b66501d479eda28eb80a489"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.0/lean-ctx-cockpit-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "e6924adb1262ad9bd6e7c821138864792f50172bbf73a7444bb8f3dc132b49ae"
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
    assert_match "lean-ctx 3.12.0", shell_output("#{bin}/lean-ctx --version")
    assert_path_exists share/"lean-ctx/cockpit/manifest.json"
  end
end
