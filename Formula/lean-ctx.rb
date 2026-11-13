class LeanCtx < Formula
  desc "Local engine for the LeanCTX Context Gateway for AI Systems"
  homepage "https://leanctx.com"
  version "3.12.4"
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
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.4/lean-ctx-aarch64-apple-darwin.tar.gz"
      sha256 "23aa100383716b56d4a1d3d1173d9a78fb2f4368723167637cefc680b57371b4"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.4/lean-ctx-cockpit-aarch64-apple-darwin.tar.gz"
        sha256 "800ada138d5b763ffbc228c5fe2d3384e6a1836d9f625cfd3be342b390221def"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.4/lean-ctx-x86_64-apple-darwin.tar.gz"
      sha256 "e4a169cf8cfed3abcdd4b8d4cd4b05f29bdaad6b6ddcc8c11af43f783be10be1"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.4/lean-ctx-cockpit-x86_64-apple-darwin.tar.gz"
        sha256 "b35158fc665ea0c9662ba2974b2a8e6a71cd9080b86b3e58d5cf926822d13a52"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.4/lean-ctx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ef0cd98ea5e2ae51646b03043d1933d9907a7c72538bc9641d6eb135557c44a5"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.4/lean-ctx-cockpit-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "62e27acd7c7a70da730f019c0bbd63bededc9d553f7caeccac5955bdc4ffe72a"
      end
    else
      url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.4/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca7a4b373d8471d5eb8eec9e3a741f9d0781eb7b0487761529c1275e45381173"

      resource "cockpit" do
        url "https://github.com/yvgude/lean-ctx/releases/download/v3.12.4/lean-ctx-cockpit-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "b2f30f05f77782fabbc2413c5dce86d9376e4b467cbbe95a266bca903db9734e"
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
    assert_match "lean-ctx 3.12.4", shell_output("#{bin}/lean-ctx --version")
    assert_path_exists share/"lean-ctx/cockpit/manifest.json"
  end
end
