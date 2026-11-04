class LeanCtx < Formula
  desc "Local engine for the LeanCTX Context Gateway for AI Systems"
  homepage "https://leanctx.com"
  version "3.12.1"
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
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.1/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "212e57ad32983e43d0c4ac5e2943b82a6caf699fe40da45745b6872d72f40b08"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.1/lean-ctx-cockpit-aarch64-apple-darwin.tar.gz"
        sha256 "f6ae124262411b5800fe6fead36ade921789e28c0cc8b2b093f0382a96fcc7cc"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.1/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "9a3d32a6b48bc2e3b89103e07ef73687eed3447b99b8ea68d531dbe2358ec623"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.1/lean-ctx-cockpit-x86_64-apple-darwin.tar.gz"
        sha256 "337da3276a27e7e9f0120aaeecd798f3a281da99322f41adf3ecd15ef78c9273"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.1/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df7afb4bff0482a1ae8e130bb4eb98e09d347a82e9fa18f49590b91dbe81d582"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.1/lean-ctx-cockpit-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "861d1f9f0e07d839ddcc776cd51ce24cc08dac7d380c09849f7431818488f1b4"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.1/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "484856a5b6bc47024ac3eacc9fcaf6fe7d5ec82ec1f16614c5521d73237238f9"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.1/lean-ctx-cockpit-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "c811c694cb01026396d1d744f163fedd71dd672cec81df643360ba3fa85c5115"
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
    assert_match "lean-ctx 3.12.1", shell_output("#{bin}/lean-ctx --version")
    assert_path_exists share/"lean-ctx/cockpit/manifest.json"
  end
end
